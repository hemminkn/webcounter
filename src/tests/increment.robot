*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Fill Text  input[name="integer"]  0
    Click  button >> text=aseta
    Get Title  ==  Laskuri
    Get Text  body  *=  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    Fill Text  input[name="integer"]  0
    Click  button >> text=aseta
    Click  button >> text=paina
    Click  button >> text=paina
    Get Text  body  *=  nappia painettu 2 kertaa

When counter has a nonzero value and it is reset the value becomes zero
    Go To  ${HOME_URL}
    Fill Text  input[name="integer"]  0
    Click  button >> text=aseta
    Click  button >> text=paina
    Click  button >> text=paina
    Get Text  body  *=  nappia painettu 2 kertaa
    Click  button >> text=nollaa
    Get Text  body  *=  nappia painettu 0 kertaa

When user chooses a new value the value becomes that
    Go To  ${HOME_URL}
    Fill Text  input[name="integer"]  0
    Click  button >> text=aseta
    Fill Text  input[name="integer"]  10
    Click  button >> text=aseta
    Get Text  body  *=  nappia painettu 10 kertaa

