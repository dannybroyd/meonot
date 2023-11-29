from flask import Flask, Response, request, send_file
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
import time
# THIS CODE IS IN PYTHON!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ALSO CLOSE DRIVER AND DELETE FROM MAP AFTER CAPTCHA
app = Flask(__name__)

option = Options()
option.add_experimental_option("detach", True)
userDriver = {}


@app.route('/safsafsafa')
def getdata():
    return "hi"


@app.route('/', methods=['POST'])
def hello():
    request_data = request.form
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=option)
    driver.get("https://meonot.shikunbinui.com")
    driver.maximize_window()
    userDriver[request_data["id"]] = driver
    senditmeonot(request_data, driver)


def senditmeonot(request_data, driver):
    # initialise all elements
    element_insert("FullName", request_data["fullname"], driver)
    element_insert("Phone", request_data["phone"], driver)
    select_from_drop_value("DormDropDown", request_data["dorm"], driver)
    select_from_drop_text("DropDownBuilding", request_data["building"], driver)
    select_from_drop_text("DropDownFloor", request_data["floor"], driver)
    select_from_drop_text("DropDownUnit", request_data["unit"], driver)
    match request_data["category"]:
        case "sleep":
            select_from_drop_value("DropDownFaultCategory", "VISITORS", driver)
            sleep(request_data, driver)
        case "visitors":
            print("TODO!")
            # TODO
        case "maintenance":
            print("TODO!")
            # TODO
    element_insert("CaptchaCodeTextBox", find_captcha(driver), driver)


def sleep(request_data, driver):
    # initialise all simple elements
    element_insert("ID_TB", id, driver)
    element_insert("GuestID_TB", request_data["guest_id"], driver)
    element_insert("GuestName_TB", request_data["guest_name"], driver)
    element_insert("GuestPhone_TB", request_data["guest_phone"], driver)
    # choose entrance date
    choose_date(request_data["entrance_month"], request_data["entrance_day"], "EntranceDate_TB", driver)
    # choose leave date
    choose_date(request_data["leave_month"], request_data["leave_day"], "LeaveDate_TB", driver)


def choose_date(month, day, name, driver):

    """
    :param driver: user's webdriver
    :param day: day you wish to choose
    :param month: month you wish to choose
    :param  name: id of web element
    changes the date of given calendar
    """
    date = element_from_id(name, driver)
    date.click()
    # clicker to go forward in months
    forward_month = element_from_xpath("//span[@class='ui-icon ui-icon-circle-triangle-w']", driver)
    month_element = element_from_xpath("//span[@class='ui-datepicker-month']", driver)
    curr_month = month_element.get_attribute('innerHTML')
    while str(curr_month) != month:
        forward_month.click()
        # element has changed, need to update
        month_element = element_from_xpath("//span[@class='ui-datepicker-month']", driver)
        curr_month = month_element.get_attribute('innerHTML')
    days_elements = driver.find_elements(By.XPATH, "//a[@href = '#']")
    for elem in days_elements:
        if str(elem.get_attribute('innerHTML')) == str(day):
            elem.click()


def element_from_id(name, driver):
    """
    :param driver: user's webdriver
    :param name: id of web element
    :return: web element with the id
    """
    return driver.find_element(By.ID, str(name))


def element_from_xpath(path, driver):
    """
    :param driver: user's webdriver
    :param path: xpath of web element
    :return: the element with the xpath
    """
    return driver.find_element(By.XPATH, str(path))


def select_from_drop_text(name, text, driver):
    """
    :param driver: user's webdriver
    :param name: id of element
    :param text: text to choose from drop down
    """
    temp = Select(element_from_id(name, driver))
    temp.select_by_visible_text(str(text))


def select_from_drop_value(name, val, driver):
    """
    :param driver: user's webdriver
    :param name: id of element
    :param val: value to choose from drop down
    """
    temp = Select(element_from_id(name, driver))
    temp.select_by_value(str(val))


def element_insert(name, text, driver):
    """
    :param driver: user's webdriver
    :param name: id of element
    :param text: text to insert
    """
    temp = element_from_id(name, driver)
    temp.send_keys(str(text))


def find_captcha(driver):
    """

    :param driver: user's webdriver
    :return: finds captcha and returns at is base64string
    """
    temp = element_from_id("c_default_recaptcha_CaptchaImage", driver)
    img_captcha_base64 = driver.execute_async_script("""
        var ele = arguments[0], callback = arguments[1];
        ele.addEventListener('load', function fn(){
          ele.removeEventListener('load', fn, false);
          var cnv = document.createElement('canvas');
          cnv.width = this.width; cnv.height = this.height;
          cnv.getContext('2d').drawImage(this, 0, 0);
          callback(cnv.toDataURL('image/jpeg').substring(22));
        }, false);
        ele.dispatchEvent(new Event('load'));
        """, temp)
    return img_captcha_base64[1:]


if __name__ == '__main__':
    app.run(debug=False)

