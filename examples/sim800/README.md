# Command line interface for SIM800 GSM

Control SIM800 GSM from you terminal.

## About

This command line interface is basic interface for controlling SIM800 GSM module. There are few commands availabe for GSM control:
* help  - Dispaly help
* at    - Run arbitrary AT command
* ussd  - Run USSD code
* sms   - Send SMS
* call  - Call arbitrary number

There is no error protection at this point. User should make sure that every parameter is correct, otherwise undefined behaviour will occur.

This interface is based on sim800 library, and this library has basic functionality which will be gradually upgraded. Next step is connecting to the internet via GSM, and after that code should be reviewed. Main flaws of this library can be seen when receiving response from GSM.

## Commands available
### help
List all available commands and show example of their use.
```
help
```
### at
Run arbitrary AT command and get a response. At this point, library doesn't guaranty that all AT commands are supported and even if the AT command is supported they might not get good response.
```
at at_cmd
```
examples:
```
at AT
```
```
at AT+CSQ
```
### ussd
Run USSD code.
```
ussd ussd_code
```
After calling this command it takes some time to get valid response. If USSD code is not valid, undefined behaviour could occur.


example:

```
ussd *100#
```
### sms
Send sms message to arbitrary phone number.
```
sms number message
```

Where:
* Phone number which will receive message
* Message which will be sent

If phone number is not valid, undefined behaviour will occur. Message should be under quotation marks.
example:

```
sms +38761xxxxxx "This message will be sent"
```
### call
Call arbitrary phone number.
```
call num/end
```
This function is used when we want to call a number, and when we want to end a call.

1. Calling a number
```
call +38761xxxxxx
```

2. Ending a call

```
call end
```
If phone number is not valid, undefined behaviour will occur.

## Authors

* **Semir Tursunovic** - semir-t

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


