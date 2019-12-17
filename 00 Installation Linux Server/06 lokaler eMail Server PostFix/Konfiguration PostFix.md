# Konfiguration des mail Programm PostFix

## Anpassen der /etc/postfix/main.cf

~~~
myhostname = mail.sgstern-kiten.de
mydomain = sgstern-kiten.de
inet_interfaces = all
~~~

## Restart des eMail Servers

systemctl restart postfix
