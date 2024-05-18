*** Keywords ***
SETUP TEST CASE
	Log Many     1. Open browser - REPEAT
	...     2. Load app URL - REPEAT

TEAR DOWN TEST CASE
	Log Many        7. Logout - REPEAT
	...             8. Browser close - REPEAT

SETUP SUITE
    Log Many        0. Setup DB

TEARDOWN SUITE
    Log Many        0. Clear DB