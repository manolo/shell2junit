#/bin/sh

#### Include the library
. `dirname $0`/sh2ju.sh

#### Clean old reports
juLogClean

#### Success command
juLog  -name=myTrueCommand                  true

#### Failure
juLog  -name=myFalseCommand                 false

#### Sleep
juLog  -name=mySleepCommand                 sleep 5

#### The test fails because the word 'world' is found in command output
juLog  -name=myErrorCommand -ierror=world   echo Hello World

#### A sql command
juLog  -name=mySqlCommand                   psql -h localhost -U postgres -c 'select now()'

#### A call to a customized method
myCmd() {
   ls -l $*
   return 0
}

juLog  -name=myCustomizedMethod             myCmd '*.sh'

