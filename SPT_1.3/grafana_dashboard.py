# Requires:
#   1.pip install selenium
#   2.pip install chromedriver-autoinstaller

from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import chromedriver_autoinstaller
from Common_function import TargetHostName
URL = "http://10.2.21.150:3000"
USER_NAME = 'admin'
USER_PASSWORD = 'Admin123'

def initWebDriver():
    chromedriver_autoinstaller.install()  # Check if the current version of chromedriver exists, if it doesn't exist, download it automatically and then add chromedriver to path.
    browser = webdriver.Chrome()
    return browser

def graphanaDashboardDisplay():
    global browser  # this will prevent the browser variable from being garbage collected
    browser = initWebDriver()
    browser.get(configDashboardUrl(TargetHostName))
    timeOutCheck()
    login(browser)

def login(browser):
    sendKeysByXPath(browser,"/html/body/grafana-app/div/div/react-container/div/div/div[2]/div/div/form/div[1]/div[2]/div/div/input",USER_NAME)
    sendKeysByXPath(browser,"/html/body/grafana-app/div/div/react-container/div/div/div[2]/div/div/form/div[2]/div[2]/div/div/input",USER_PASSWORD)
    clickElementByXpath(browser,"/html/body/grafana-app/div/div/react-container/div/div/div[2]/div/div/form/button")

def configDashboardUrl(targetHostName='',minute=1,disk='C',nic='All',autoRouter='createhcff',mvs='adt_service',mvs_secured='adt_service',fir='',svdser='svdser'):
    urlExtention=f"/d/LNOgvrFGz/app-db-dashboard-working-oct-2020?orgId=1&var-host={targetHostName}&var-dbserver={targetHostName}&var-target={targetHostName}&var-interval={minute}m&var-disks={disk}:&var-nic={nic}&var-AR={autoRouter}&var-MVS={mvs}&var-MVS_Secured={mvs_secured}&var-FIR={fir}&var-Processes={svdser}"
    return URL+urlExtention

# Selenium helper functions:
def timeOutCheck(timeout = 5):
    try:
        element_present = EC.presence_of_element_located((By.XPATH, "/html/body/grafana-app/div/div/react-container/div/div/div[1]/div/h1"))
        WebDriverWait(browser, timeout).until(element_present)
        print("Page is ready!")
    except TimeoutException:
        print("Timed out waiting for page to load")

def clickElementByXpath(browser,xpath):
    browser.find_element_by_xpath(xpath).click()

def clickElementById(browser,id):
    browser.find_element_by_id(id).click()

def clickElementByClass(browser,className):
    browser.find_element_by_class_name(className).click()
def sendKeysByXPath(browser,xpath,strContent):
    browser.find_element_by_xpath(xpath).send_keys(strContent)
if __name__ == '__main__':
    graphanaDashboardDisplay()
