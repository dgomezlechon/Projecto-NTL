from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager

opciones=Options()

opciones.add_experimental_option('excludeSwitches', ['enable-automation'])
opciones.add_experimental_option('useAutomationExtension', False)
opciones.headless=False    # si True, no aperece la ventana (headless=no visible)
opciones.add_argument('--start-maximized')         # comienza maximizado
#opciones.add_argument('user-data-dir=selenium')    # mantiene las cookies
#opciones.add_extension('driver_folder/adblock.crx')       # adblocker
opciones.add_argument('--incognito')

import warnings
warnings.filterwarnings('ignore')

PATH=ChromeDriverManager().install()

def earnings(tickers):
    
      #'''Esta función lee una lista de tickers de compañias, escrapea la página web alphaquery para cada una de esas empresas y devuelve una lista de DataFrames con datos de los earnings de cada compañía'''

        lista_tablas = []
    url1="https://www.alphaquery.com/stock/"
    url2="/earnings-history"
    
    for i in tickers:
        
        url=url1+i+url2

        driver=webdriver.Chrome(PATH, options = opciones)
        driver.get(url)
        name=i
        #sacamos los headers:
        tabla=driver.find_element_by_xpath("/html/body/div[2]/div/div[2]/div[1]/table/thead")
        filas=tabla.find_elements_by_tag_name('th')
        
        headers=[e.text for e in  filas]
        
        #sacamos el cuerpo:
        tabla=driver.find_element_by_xpath("/html/body/div[2]/div/div[2]/div[1]/table/tbody")
        filas=tabla.find_elements_by_tag_name('tr')
        
        data=[e.text for e in  filas]
        
        data2=[]
        for e in data:
            data2.append(e.split())
        
        #los unimos en un DataFrame
        
        tabla=pd.DataFrame(data2,columns=headers)
        lista_tablas.append(tabla)
        
    return lista_tablas
    



    
def quitar_dolar(frame):
    
      #'''Esta función lee un DataFrame y devuelve el Dataframe sin símbolos de dolar'''
    
    for i in range(len(frame["Estimated EPS"])):
    
        frame["Estimated EPS"]=frame["Estimated EPS"][i].replace("$","") 
        frame["Actual EPS"]=frame["Actual EPS"][i].replace("$","") 
        
        
        
        
def cambiar_tipo_datos2(frame):
    
     #'''Esta función cambia el tipo de datos de las tablas price '''

    columns=frame.columns
    
    for i in range(0,1):
        pd.to_datetime(frame[columns[i]], format='%Y-%m-%d')
  
    for i in range(1,7):
        frame[columns[i]]=frame[columns[i]].astype(dtype="float")
        
        
        
def col_price_change(prices_list):
    
     #'''Esta función añade en las tablas _price una columna de price change'''
    
    for j in range(len(prices_list)):
    
        prices_list[j]['Price_change']=prices_list[j]['Close']
    
    

        for i in range(len(twitter_price.Close)):
 
            if i>0:
                prices_list[j]['Price_change'][i]=prices_list[j]['Close'][i-1]
        
        prices_list[j]['Price_change']=100*(prices_list[j]['Close']-prices_list[j]['Price_change'])/prices_list[j]['Price_change']