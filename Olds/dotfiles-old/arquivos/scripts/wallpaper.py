from urllib.request import urlopen, urlretrieve
from bs4 import BeautifulSoup
import datetime
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

# Retrive/download Image
# access website
url = "https://apod.nasa.gov/apod/"
html = urlopen(url)
soup = BeautifulSoup(html, 'html.parser')

# get link to image
img_links = soup.findAll("a")
for img_link in img_links:
    if img_link.get('href').endswith('.jpg'):
        target = img_link.get('href')

target_url = url + target

# download image
name = "wallpaper"+str(datetime.date.today()) +".jpg"

urlretrieve(target_url, name)

#find out top colors in image
# go to site http://mkweb.bcgsc.ca/color-summarizer/?analyze
driver = webdriver.Chrome()
driver.get('http://mkweb.bcgsc.ca/color-summarizer/?analyze')

# select correct options: html, 3 colors, medium precision
driver.find_element_by_xpath(".//input[@name='num_clusters' and @value='3']").click()

driver.find_element_by_xpath(".//input[@name='precision' and @value='medium']").click()

# upload file
# You must edit the below line to be the path where you saved the image from line 24
driver.find_element_by_name('image').send_keys('~/Imagens/'+ name)

# submit and wait
driver.find_element_by_name('.submit').click()

colors=[]
# find html codes and collect
for elem in driver.find_elements_by_class_name('coords'):
    if elem.text.startswith('#'):
        colors.append(elem.text)

#assign colors to variables
firstcolor = colors[0]
secondcolor = colors[1]
thirdcolor = colors[2]

#close webdriver
driver.close()


# Edit Config File
 #open config
with open('~/.config/i3/config', 'r') as file:
#     read a list of lines into data
    data = file.readlines()

# change line with wallpaper name
data[153] = 'exec_always feh --bg-scale edit me with your image path' + name +  '\n'

# Change lines for window colors
data[159] = 'client.focused' +'    '+  firstcolor +'    '+ thirdcolor +'    '+ firstcolor
data[161] = 'client.focused_inactive' + firstcolor +'    '+ thirdcolor +'    '+ firstcolor
data[163] = 'client.unfocused'  +'    '+  secondcolor +'    '+ thirdcolor +'    '+ secondcolor
data[178]= 'focused_workspace' +'    '+  firstcolor +'    '+ thirdcolor +'    '+ firstcolor
data[180] = 'active_workspace'  +'    '+  firstcolor +'    '+ thirdcolor +'    '+ firstcolor
data[182] = 'inactive_workspace' +'    '+ secondcolor +'    '+ thirdcolor +'    '+ secondcolor

# save and close config file
with open ('~/.config/i3/config', 'w') as file:
    file.writelines( data )


print('Done! Press mod + shift + r')

