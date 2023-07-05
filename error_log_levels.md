SYSLOG Error Levels
==============================


Numerical codes and abbreviations are from **syslog**(3).  
Enums and descriptions are from *systemd* **journalctl**(1).  

The levels are, in order of decreasing importance:  

| CODE	| ABBR		| ENUM		| DESC					|
|-------|---------------|---------------|---------------------------------------|
| 0	| emerg		| `LOG_EMERG`	| system is unusable			|
| 1	| alert		| `LOG_ALERT`	| action must be taken immediately	|
| 2	| crit		| `LOG_CRIT`	| critical conditions			|
| 3	| err		| `LOG_ERR`	| error conditions			|
| 4	| warning	| `LOG_WARNING`	| warning conditions			|
| 5	| notice	| `LOG_NOTICE`	| normal, but significant, condition	|
| 6	| info		| `LOG_INFO`	| informational message			|
| 7	| debug		| `LOG_DEBUG`	| debug-level message			|


