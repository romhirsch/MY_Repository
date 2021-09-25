from flask import Flask, render_template,request,redirect,url_for,flash,make_response,send_file
from datetime import datetime
import pandas as pd
import os
from flask_uploads import IMAGES, UploadSet, configure_uploads
import io

import csv
import re

#%%
def CreateNewCsv():
    df = pd.DataFrame({
        "פעולות": [],
        "תמונה": [],
        "דחיפות התיקון": [],
        "מהות התקלה": [],
        "טלפון": [],
        "כתובת": [],
        "שם הלקוח": [],
        "תאריך פתיחת הקריאה": []
    })
    df.to_csv("data.csv", index=False, encoding='utf-8-sig', mode="w", header=True)

def appendCsv(image, severity, fault, phone, address, nameClient, dateOfOpen):
    a = pd.read_csv(r"data.csv", encoding='utf-8-sig')
    i = a.shape[0]
    operation = f"<form action=\"delete\{i}\" method=\"POST\"><button name=\"forwardBtn\" type=\"submit\">delete</button></form>" \
             #   + f"<form action=\"Edit\{i}\" method=\"POST\"><button name=\"forwardBtn2\" type=\"submit\">edit</button></form>"
    df = pd.DataFrame({
        "פעולות": [operation],
        "תמונה": [image],
        "דחיפות התיקון": [severity],
        "מהות התקלה": [fault],
        "טלפון": [phone],
        "כתובת": [address],
        "שם הלקוח": [nameClient],
        "תאריך פתיחת הקריאה": [dateOfOpen]
    })
    df.to_csv("data.csv", index=False, encoding='utf-8-sig', mode="a", header=False)

def deleteCsv(index):
    a = pd.read_csv(r"data.csv", encoding='utf-8-sig')
    narray = a.to_numpy()
    for i,row in enumerate(narray):
        if f"delete\\{index}" in row[0]:
            imageName=re.findall("/image/\w+.\w+",row[1])[0]
            imageName=imageName.replace("image","static")
            SCRIPT_PATH = os.path.abspath(os.path.dirname(__file__))
            imagePath = SCRIPT_PATH+imageName
            if os.path.exists(imagePath):
                os.remove(imagePath)
            else:
                print("The file does not exist")
            a=a.drop([i])
            a.to_csv("data.csv", index=False, encoding='utf-8-sig', mode="w", header=True)
    print("error")
    return None


    
# %%
dateOfOpen = datetime.now()
nameClient = "רום"
address = " ז'בוטינסקי 45 ב"
phone = "0503533410"
fault = " תקלה בXXX"
severity = "דחוף"
image = r"c:\\"
a = pd.read_csv(r"data.csv", encoding='utf-8-sig')
i = a.shape[0]
operation =f"<form action=\"delete\{i}\" method=\"POST\"><button name=\"forwardBtn\" type=\"submit\">delete</button></form>"\
          #  + f"<form action=\"Edit\{i}\" method=\"POST\"><button name=\"forwardBtn2\" type=\"submit\">edit</button></form>"
operation=operation.replace("{","{{")
operation=operation.replace("}","}}")


row = [image, severity, fault, phone, address, nameClient, dateOfOpen, operation]
#%%
#appendCsv(image, severity, fault, phone, address, nameClient, dateOfOpen, operation)


# df.append(row)
# df.to_csv("data.csv", index=False ,encoding = 'utf-8-sig',mode="a",header=False)
# df.to_csv("data.csv", index=False ,encoding = 'utf-8-sig',mode="w",header=True)
# %%

def CreateTable():
    # to read csv file
    a = pd.read_csv(r"data.csv", encoding='utf-8-sig',dtype=str)
    # to save as html file
    # a.to_html("Table.htm")

    # assign it to a
    # variable (string)
    html_file = a.to_html(escape=False)
    #html_file = html_file.replace("Buttons",f"<button type=\"button\">מחק</button><button type=\"button\"><a href=\"/Edit/{i}\">עריכה</a></button>")
    html_file += """
    </body>
    </html>

    """
    
    return html_file

#mainPage = CreateMainPage()
# %% Flask

app = Flask(__name__)
photos = UploadSet("photos", IMAGES)
app.config["UPLOADED_PHOTOS_DEST"] = "static"
app.config["SECRET_KEY"] = os.urandom(24)
configure_uploads(app, photos)

@app.route("/",methods=["GET","POST"])
def home():
    if request.method == "POST":
        tableData = CreateTable()
        return render_template("mainPage.html", message="", data=tableData)
    else:
        tableData = CreateTable()
        return render_template("mainPage.html", message="",data=tableData,imageName="logo.png")


@app.route("/Edit/<int:index>",methods=["GET","POST"])
def Edit(index):
    if request.method == "POST":


        return redirect(url_for('home'))
    else:
        return render_template("editPage.html", index=index,headers=a.columns)
@app.route("/delete/<int:index>",methods=["GET","POST"])
def deleteEntity(index):
    deleteCsv(index)
    return redirect(url_for('home'))

@app.route("/New",methods=["GET","POST"])
def addEntity():
    if request.method == 'POST' and 'photo' in request.files:
        if request.files['photo'].filename:
            imageName=photos.save(request.files['photo'])
        else:
            imageName = ''
        flash(f"Photo saved successfully.{imageName}")
        dateOfOpen = request.form["date"]
        nameClient = request.form["clientName"]
        address = request.form["addres"]
        phone = request.form["phone"]
        fault = request.form["faultImformation"]
        severity = request.form["severity"]
        #image = f'<img src="/static/{imageName}" alt="image" width="500" height="500">'
        #im = f"url_for(\'imageEntity\', imageName=\"{imageName}\")"
        #im = "{{" + im +"}}"
        im = f'/image/{imageName}'
        image = f'<form action="{im}" method="Get" align="right">\
        <button name="ssss" type="submit">צפה</button>\
        </form>'
        appendCsv(image, severity, fault, phone, address, nameClient, dateOfOpen)
        #return render_template("NewEntity.html",imageName=imageName)
        return redirect(url_for('home'))
    elif request.method == "POST":
        dateOfOpen = request.form["date"]
        nameClient = request.form["clientName"]
        address = request.form["addres"]
        phone = request.form["phone"]
        fault = request.form["faultImformation"]
        severity = request.form["severity"]
        image = ''
        appendCsv(image, severity, fault, phone, address, nameClient, dateOfOpen)
        return redirect(url_for('home'))
    else:
        return render_template("NewEntity.html",imageName="")
#{{url_for('home')}}

@app.route("/upload", methods=['GET', 'POST'])
def upload():
    if request.method == 'POST' and 'photo' in request.files:
        photos.save(request.files['photo'])


        flash("Photo saved successfully.")
        return render_template('uploadTest.html')
    return render_template('uploadTest.html')
@app.route("/download", methods=['GET', 'POST'])
def downloadCsv():
    print("test")
    a = pd.read_csv(r"data.csv", encoding='utf-8-sig')
    a.drop('פעולות', inplace=True, axis=1)
    a.drop('תמונה', inplace=True, axis=1)
    s = a.to_csv(index=False, header=True, sep=",")
    buf_str = io.StringIO(s)
    buf_byt = io.BytesIO(buf_str.read().encode('utf-8-sig'))
    return send_file(buf_byt,
                     mimetype="text/csv",
                     as_attachment=True,
                     attachment_filename="data.csv")

@app.route("/image/<string:imageName>",methods=["GET","POST"])
def imageEntity(imageName=None):
    imageName=imageName.strip()
    print(imageName)
    return render_template("imagePage.html", imageName=imageName)




app.run(host="0.0.0.0",debug = True)


