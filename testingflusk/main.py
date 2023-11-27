from flask import Flask, Response, request, send_file
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
import time

app = Flask(__name__)

option = Options()
option.add_experimental_option("detach", True)

@app.route('/safsafsafa')
def getdata():
    return "hi"


@app.route('/', methods=['POST'])
def hello():
    request_data = request.form
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=option)
    driver.get("https://meonot.shikunbinui.com")
    driver.maximize_window()

    def senditmeonot(rec_fullname, rec_phone, rec_dorm, rec_building, rec_floor, rec_unit):
        # initialise all elements
        element_insert("FullName", rec_fullname)
        element_insert("Phone", rec_phone)
        select_from_drop_value("DormDropDown", rec_dorm)
        select_from_drop_text("DropDownBuilding", rec_building)
        select_from_drop_text("DropDownFloor", rec_floor)
        select_from_drop_text("DropDownUnit", rec_unit)
        select_from_drop_value("DropDownFaultCategory", "VISITORS")
        visitor(212292635, "דצמבר", 3, "דצמבר", 5, 322462045, "Diana Shmidt", "0522446034")
        element_insert("CaptchaCodeTextBox", find_captcha())

    def visitor(rec_id, rec_entrance_month, rec_entrance_day, rec_leave_month, rec_leave_day, rec_guest_id,
                rec_guest_name, rec_guest_phone):
        # initialise all simple elements
        element_insert("ID_TB", rec_id)
        element_insert("GuestID_TB", rec_guest_id)
        element_insert("GuestName_TB", rec_guest_name)
        element_insert("GuestPhone_TB", rec_guest_phone)
        # choose entrance date
        choose_date(rec_entrance_month, rec_entrance_day, "EntranceDate_TB")
        # choose leave date
        choose_date(rec_leave_month, rec_leave_day, "LeaveDate_TB")

    def choose_date(month, day, name):

        """
        :param day: day you wish to choose
        :param month: month you wish to choose
        :param  name: id of web element
        changes the date of given calendar
        """
        date = element_from_id(name)
        date.click()
        # clicker to go forward in months
        forward_month = element_from_xpath("//span[@class='ui-icon ui-icon-circle-triangle-w']")
        month_element = element_from_xpath("//span[@class='ui-datepicker-month']")
        curr_month = month_element.get_attribute('innerHTML')
        while str(curr_month) != month:
            forward_month.click()
            # element has changed, need to update
            month_element = element_from_xpath("//span[@class='ui-datepicker-month']")
            curr_month = month_element.get_attribute('innerHTML')
        days_elements = driver.find_elements(By.XPATH, "//a[@href = '#']")
        for elem in days_elements:
            if str(elem.get_attribute('innerHTML')) == str(day):
                elem.click()

    def element_from_id(name):
        """

        :param name: id of web element
        :return: web element with the id
        """
        return driver.find_element(By.ID, str(name))

    def element_from_xpath(path):
        """

        :param path: xpath of web element
        :return: the element with the xpath
        """
        return driver.find_element(By.XPATH, str(path))

    def select_from_drop_text(name, text):
        """

        :param name: id of element
        :param text: text to choose from drop down
        """
        temp = Select(element_from_id(name))
        temp.select_by_visible_text(str(text))

    def select_from_drop_value(name, val):
        """

        :param name: id of element
        :param val: value to choose from drop down
        """
        temp = Select(element_from_id(name))
        temp.select_by_value(str(val))

    def element_insert(name, text):
        """

        :param name: id of element
        :param text: text to insert
        """
        temp = element_from_id(name)
        temp.send_keys(str(text))
    senditmeonot(request_data["fullname"],request_data["phone"], request_data["dorm"],request_data["building"],request_data["floor"], request_data["unit"])

    def find_captcha():
        temp = element_from_id("c_default_recaptcha_CaptchaImage")
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

