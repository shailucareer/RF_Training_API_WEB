*** Settings ***
Library     OperatingSystem


*** Variables ***
${HTML_CONTENT}     <html><head><title>Custom HTML Report</title></head><body><h1> My Custom HTML Report</h1><table border="1"><tr> <th>Test Name</th> <th>Status</th>  <th>Step Desc</th>   <th>Screenshot link</th> </tr><tr> <td>TC1</td> <td></td> <td></td> <td></td> </tr>   <tr> <td></td> <td>Info</td> <td>Desc1.1</td> <td></td> </tr>    <tr> <td></td> <td>Pass</td> <td>Desc1.2</td> <td></td> </tr>    <tr> <td></td> <td>Fail</td> <td>Desc1.3</td> <td></td> </tr>    <tr> <td>TC2</td> <td></td> <td></td> <td></td> </tr>    <tr> <td></td> <td>Info</td> <td>Desc2.1</td> <td></td> </tr>    <tr> <td></td> <td>Pass</td> <td>Desc2.2</td> <td></td> </tr>    <tr> <td></td> <td>Fail</td> <td>Desc2.3</td> <td></td> </tr></table></body></html>


*** Test Cases ***
Create a simple html file
    Create File    ${CURDIR}/DynamicReport.html       ${HTML_CONTENT}
