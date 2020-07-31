from behave import *
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager


@given(u'launch chrome browser')
def step_impl(context):
    context.driver = webdriver.Chrome(ChromeDriverManager().install())
    context.driver.maximize_window()


@when(u'open orange hrm homepage')
def step_impl(context):
    context.driver.get("https://opensource-demo.orangehrmlive.com/")
    context.driver.find_element_by_id('txtUsername').send_keys('Admin')
    context.driver.find_element_by_id('txtPassword').send_keys('Admin')
    context.driver.find_element_by_id('btnLogin').click()


@then(u'verify that the logo present on page')
def step_impl(context):
    try:
        assert context.driver.find_element_by_xpath("//h1[.='Dashboard']").is_displayed() is True
    except Exception as e:
        print(e.__doc__)


@then(u'Close browser')
def step_impl(context):
    context.driver.close()
