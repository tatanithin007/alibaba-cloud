from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.utils import ChromeType
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
import logging
# enable browser logging
d = DesiredCapabilities.CHROME
d['goog:loggingPrefs'] = { 'browser':'ALL' }

options = webdriver.ChromeOptions()
options.add_argument("----start-maximized")
#options.add_argument("--window-size=1440,789")
options.add_argument("user-data-dir=/home/chrome/.config/google-chrome/")
options.add_argument("load-extension=/home/chrome/git_file/super-stable")
options.add_experimental_option("excludeSwitches", ["enable-automation"])
options.add_experimental_option('useAutomationExtension', False)
driver = webdriver.Chrome(ChromeDriverManager().install(),options=options,desired_capabilities=d)

def get_browser_log_entries(driver):
    """get log entreies from selenium and add to python logger before returning"""
    loglevels = { 'NOTSET':0 , 'DEBUG':10 ,'INFO': 20 , 'WARNING':30, 'ERROR':40, 'SEVERE':40, 'CRITICAL':50}

    #initialise a logger
    browserlog = logging.getLogger("chrome")
    #get browser logs
    slurped_logs = driver.get_log('browser')
    for entry in slurped_logs:
        #convert broswer log to python log format
        rec = browserlog.makeRecord("%s.%s"%(browserlog.name,entry['source']),loglevels.get(entry['level']),'.',0,entry['message'],None,None)
        rec.created = entry['timestamp'] /1000 # log using original timestamp.. us -> ms
        try:
            #add browser log to python log
            browserlog.handle(rec)
        except:
            print(entry)
    #and return logs incase you want them
    return slurped_logs


driver.get("chrome://version")
time.sleep(5)
consolemsgs = get_browser_log_entries(driver)
print(consolemsgs)

d = DesiredCapabilities.CHROME
d['goog:loggingPrefs'] = { 'browser':'ALL' }

options = webdriver.ChromeOptions()
options.add_argument("----start-maximized")
#options.add_argument("--window-size=1440,789")
options.add_argument("user-data-dir=/home/chrome/snap/chromium/common/chromium/")
options.add_argument("load-extension=/home/chrome/git_file/super-stable")
options.add_experimental_option("excludeSwitches", ["enable-automation"])
options.add_experimental_option('useAutomationExtension', False)

#/home/chrome/snap/chromium/common/chromium/Default/
webdriver.Chrome(ChromeDriverManager(chrome_type=ChromeType.CHROMIUM).install()),options=options,desired_capabilities=d)
driver.get("chrome://version")
time.sleep(5)
consolemsgs = get_browser_log_entries(driver)
print(consolemsgs)

# webdriver.Opera(executable_path=OperaDriverManager().install()),
# webdriver.Chrome(ChromeDriverManager().install())

# for i in j:
#     print(i)