# Proxy Router

![logo](https://user-images.githubusercontent.com/49291467/117601439-62d10c00-b11c-11eb-9a11-5a2b97fa2c79.png)

## WTF
Разбирая в очередной раз груды непонятных скриптов, наткнулая на эту штуку. Этому проекту не менее трех лет. Прошу не судить меня строго, в то время я тоько начал постигать дзен) Привел в порядок проект, все проверил, все работает отлично. Итак, что нам нужно? Ну или по-крайней мере на каком устройстве данный скрипт будет работать 100%)) итак, поехали:

## Особенности:

    * "Правильный" WebRTC "железным" методом. +10 к "карме" ;-)
    * "Правильный" DNS сервер. Еще десяточку
    * Смена mac каждую раздачу. В среднем "поднятие" новой точки доступа занимает не больше 30 секунд
    * Каждая перезагрузка - смена hostname
    * Веб-интерфейс вместо привычного SSH. SSH после перезагрузки, кстати, станет 65022. 
    * Windows TCP/IP стек
    * ВАШ бюджет: примерно 40 американских рублей :)
    * .... и много всяких мелочей, про которые уже трудно вспомнить...

## requirements.txt

    1. FriendlyElec NanoPi2 with OLED Hat and metal box. Не самое современное устройство, в нем нет встроенного чипа 802.11 ...  
    2. ...так что я использую покупную, а а именно USB dongle Comfast CF-811AC.
    3. Образ Armbian для одноименного устройства, с последней стабильной версией Debian. Сборка Server
    4. Прямые руки :) Флешка, Ethernet провод и остальные прикладные мелочи.

После получение вышеперечисленных артифактов, записываем Armbian...iso на SD флешку (я использую [balena.io/etcher](url)), вставляем ее в устройство, подключаем проводом к домашней сети, находим устройство (лучше всего для этого подойдет Fing!, он есть магазине приложений для любого мобильного устройства), точнее его внутренний айпи адрес. Подключаемся к нему по ssh. Проходим стандартные процедуры ввода паролей и создания пользователя (любого). Вставляем вай-фай антенну в роутер.

## install.sh

После попадания в саму систему, сразу же меняем root пароль на самый простой, так же меняем пароль пользователю. Редактируем файл /etc/sudoers (nano /etc/sudoers), приводим содержание трех строчек к такому виду:

```
root    ALL=(ALL) NOPASSWD: ALL
x       ALL=(ALL) NOPASSWD: ALL
%sudo   ALL=(ALL) NOPASSWD: ALL
```
Соответственно х у меня - это Ваше имя пользователя, которое Вы только что создали у себя на устройстве. Далее заходим в стандартную для Armbian GUI оболочка командой armbian-config, в разделе System => CPU меняем диапазон значений работы ЦП от самого минимального, до максимума, мощность работы процессора так же выставляем на максимум. Выходим в шелл.

```
su root ; cd ~
git clone https://gitlab.com/x4k/pr /root/rrr ; cd /root/rrr ; bash install.sh
```
На этом Ваши действия заканчиваются, вы идете пить кофе, хакать пентагон и заниматься остальными своими делами. Через 30-50 минут Вы получите готовое устройство. Управрение устройством максимально удобное, после перезагрузки 22 порт станет недоступен, зато появиться веб-терминал по адрему http://ip_устройства:65000. Подключаемся, вводим имя пользователя и пароль (не рут). При первом входе в систему пишем следующее (чтобы автоматически перекидывало в root аккаунт): `echo 'sudo zsh' >> ~/.bashrc ; echo 'sudo zsh' >> ~/.zshrc`

## How2

На этом все. Вся информация, нужная для удачного использования устройства находится перед вами. Выполняем любую из команд и следуем простым инструкциям. Интерфейс максимально дружелюбен. Чего и Вам желаю ;-)

## ЗЫ:

Мною были использованы два этих потрясающих инструменты, которые похожи как брат с сестрой. Ума не приложу, зачем мне понадобились оба, но они тут:

https://github.com/nadoo/glider

https://github.com/ginuerzh/gost
