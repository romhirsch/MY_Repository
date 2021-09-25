from email.message import EmailMessage
import email, smtplib, ssl
from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

port = 465  # For SSL
password = "Rom1234@"

# Create a secure SSL context
context = ssl.create_default_context()
sender_email = "rom2100@gmail.com"
filename = r"data.csv"
receiver_email = sender_email
message = """\
Subject: Hi there
This message is sent from Python."""


#%%



subject = "קריאות פתוחות הודעה אוטומטית"
body = "מצורף קובץ של כל הקריאות הפתוחות"
sender_email = "rom2100@gmail.com"
receiver_email = "rom2100@gmail.com"
password = "Rom1234@"

# Create a multipart message and set headers
message = MIMEMultipart()
message["From"] = sender_email
message["To"] = receiver_email
message["Subject"] = subject
message["Bcc"] = receiver_email  # Recommended for mass emails

# Add body to email
message.attach(MIMEText(body, "plain"))

filename = r"data.csv"

# Open PDF file in binary mode
with open(filename, "rb") as attachment:
    # Add file as application/octet-stream
    # Email client can usually download this automatically as attachment
    part = MIMEBase("application", "octet-stream")
    part.set_payload(attachment.read())

# Encode file in ASCII characters to send by email    
encoders.encode_base64(part)

# Add header as key/value pair to attachment part
part.add_header(
    "Content-Disposition",
    f"attachment; filename= {filename}",
)

# Add attachment to message and convert message to string
message.attach(part)
text = message.as_string()

# Log in to server using secure context and send email
context = ssl.create_default_context()
with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
    server.login(sender_email, password)
    server.sendmail(sender_email, receiver_email, text)