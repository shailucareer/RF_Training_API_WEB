from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()  # Use the path to your ChromeDriver
driver.get('https://www.google.com')  # Use your website url
driver.find_element(By.NAME,'r').send_keys("Automation Testing",Keys.ENTER)
time.sleep(5)
driver.quit()