
*** Settings ***
Resource    SetupTeardownCommon.robot
Suite Setup     SETUP SUITE
Suite Teardown     TEARDOWN SUITE
Test Setup      SETUP TEST CASE
Test Teardown   TEAR DOWN TEST CASE

*** Test Cases ***

TC1 - Verify inbox
	Log Many     3. Login perform
	...          4. Inbox read
	Should Be Equal As Strings    Apple    Banana

TC2 - Verify outbox
	Log Many     3. Login perform
	...     5. New mail send
	...     6. Verify outbox

