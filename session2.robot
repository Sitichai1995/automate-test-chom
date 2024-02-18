*** Settings ***
Library         Selenium2Library
#Test Teardown       Close Browser

*** Variables ***
${web}         https://www.nejavu.com
${browser}        gc
${modal}        //*[@id="top"]/main/div[2]/div[1]
${close_modal}        //*[@id="top"]/main/div[2]/div[1]/a
${cartoon_tab}        //*[@id="top"]/main/div[1]/div[2]/div[2]/div[2]/nav/div/ul/li[3]/a
${cartoon_head}        //*[@id="top"]/main/div[1]/div[1]/div/div/div[2]/div/div[2]/div/a
${cartoon_name_1}        //*[@id="top"]/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[1]/div/div[2]/a[1]/h5
${all_cartoon}        //*[@id="top"]/main/div[1]/div[3]/div[1]/div[6]/div[2]
${box_cartoon}        class="detail-title"
...   #//*[@id="top"]/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[1]

*** Test Cases ***
open_browser
    Open Browser        ${web}        ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element        ${modal}
    Click Element        ${close_modal}
    Click Element        ${cartoon_tab}
    Wait Until Page Contains Element        ${cartoon_head}
    ${book_title} =        Get Text    ${cartoon_name_1}
    Log                    ${book_title}
    ${rows}        get element count        ${all_cartoon}
    ${box}        Get Element Count        ${box_cartoon}
    Log To Console        ${box}
    Log To Console        ${rows}
    Sleep    5s