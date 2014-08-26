from selenium import webdriver
driver = webdriver.Firefox()
driver.get("http://vnthuquan.net/truyen/")
text=[]
stop=0
stop1=0
while stop1<100:
	#text.append(driver.page_source)
	#stop=int(driver.find_elements_by_xpath("//td[@colspan='4']/a[@href]")[1].text)
	#if stop=1:
		

	#nextPageCollections=driver.find_elements_by_xpath("//td[@colspan='4']/a[@href]")[10]
	
	#nextPageCollections.click()
	
	stop=1
	while (stop1%10)==0:
		text.append(driver.page_source)
		stop1=int(driver.find_elements_by_xpath("//td[@colspan='4']/a[@href]")[stop].text)
		
		a=driver.find_elements_by_xpath("//td[@colspan='4']/a[@href]")[stop].click()
		stop+=1
		
	
	

	

from selenium import webdriver
from decimal import *
driver = webdriver.Firefox()
driver.get("http://vnthuquan.net/truyen/")
text=[]
stop=0
stop1=0

	
while stop1<20:
	text.append(driver.page_source)
	stop1=Decimal((driver.find_element_by_xpath("//td[@colspan='4']/span").text))
	if ((stop1%10)==0):
		u=unicode(Decimal(stop1+1))
		print u
		b=driver.find_element_by_xpath("//td[@colspan='4']/a[contains(.,'"+u+"')]").click()
	else:
		u=u'...'
		b=driver.find_elements_by_xpath("//td[@colspan='4']/a[contains(.,u)]")[1].click()
	print b
		



