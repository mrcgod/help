A „tétel”:
Nagy vonalakban hogy miről is szól:
 Virtualbox
 Ubuntu 16.04 (Bridgelt kártya, DHCP által kell kapjon címet)
 Ansible leszedése, telepítése
 git clone - wordpress playbook
 wordpress konfigurálása
 wordpress weblap készítése
Parancsról parancsra:
(csak felidézésből megy a dolog, mert nincs nálam saját gép hogy újra meg tudjam csinálni a dolgokat)
1. Remélem a virtualboxos részt és egyéb dolgokat nem kell magyarázni, mert az
mindenkinek reflexből jön ☺
2. Tipp: SSH-val könnyebben boldogul az ember, ha az ubuntu esetleg angol
billentyűzettel lenne + mehet a ctrl+c ctrl+v.
SSH menete: virtuálisgépneve@virtuálisgépcíme , majd kérni fogja a virtuális gép
jelszavát. Kész is 
PL: vizsgagep@192.168.2.75
3.
a. Ansible lehúzása SAJÁT githubról:
Pl: https://github.com/fiokod/ansible
Belépünk a megfelelő könyvtárba, majd jöhet a telepítés:
sudo bash ansible… (nem emlékszem a nevére, de a tabulátor mindent megold)
b. Ha nem akarunk gitezni, akkor eme imasorokat beírjuk egyesével:
sudo apt update
sudo apt install software-properties-common –í
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible –y
Ha sikerült végrehajtani ezek közül valamelyiket, akkor utána jöhet a verzió számának
a lekérdezése: ansible --version
4. Wordpress: ugyanúgy, mint az Ansible-nél, de leírom. (Ha valakinek a repojában az
ansible és a wordpress esetleg együtt lenne, akkor az megspórolt egy pár parancsot)
Githubról: git clone https://github.com/fiokod/wordpress
sudo bash wordpress… (#tabulátormegintsegít)
5. Wordpress installálása után belépünk a megfelelő könyvtárba, majd szerkesszük meg
az index.html fájlt olyanra, amilyenre a feladat kéri.
6. Emlékeim szerint nem ártana ha a wordpressbe belépünk. Ezt úgy tudjuk megtenni,
hogy a terminálba nyomunk egy ifconfig parancsot (vagy egyéb parancsot amivel
megtudjuk gépünk IP címét), majd a böngészőbe beírva a címet megkapjuk az
oldalunkat, ahova regisztrálni vagy pedig be kell lépni. Szerintem ezt majd a vizsgán
belül elmondják hogy ki mivel hogyan és merre meddig regisztráljon – máskülönben
ahogy esik úgy puffan.
7. Ezek után ha jól tudom akkor kész is minden. De amúgy hajam színe szőke, ráadásul
nyolcad részben zsidó is vagyok, úgyhogy nem szabad bízni bennem 
B „tétel”:
Nagy vonalakban hogy miről is szól:
 Virtualbox
 Ubuntu 16.04 (Bridgelt kártya, DHCP által kell kapjon címet)
 docker motor telepítése
 dockerfile készítése
 docker image készítése
 docker konténer indítása
 webszerver működtetése
MINDENEK ELŐTT SZERETNÉM MEGEMLÍTENI, HOGY EHHEZ KELLENI FOG A DOCKERES
FIÓKOD IS! Úgyhogy ne felejtsük el a vizsga napján a nevet és a jelszót 
1. Docker telepítése:
a. Ha van a github-on külön erre repo, akkor szokás szerint jöhet a
git clone https://github.com/fiokod/dockermc és utána jöhet a 
sudo bash docker… (nevét nem tudom fejből, úgyhogy tabulátor)
b. Ha nem lenne githubodon, akkor jönnek az újabb imasorok:
FROM ubuntu:16.04
MAINTAINER dockeresneved
RUN apt-get –y update \
&& apt-get –y upgrade \
&& apt-get –y install mc \
&& apt-get –y clean
WORKDIR /root
2. Webszerver – lánykori nevén NGINX:
Itt annyit szeretnék mondani, hogy githubomon van egy dockerngnix repo, ahol egy
docker-install.sh cucc van. Ebben benne van a Docker telepítése is, de leírom ide a
parancsokat:
sudo apt update
sudo apt-get install –y \
apt-transport-https \
ca-certificates \
curl \
software-properties-common
curl –fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
’’dep [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release –cs) \
stable ’’
sudo apt update
sudo apt install –y docker-ce
Én ezek után csak egy dolgot szeretnék mondani: szopás ha nem gitről szedünk le
mindent .
A dockerngnix repomban van a Dockerfile, ahol maga az ngnix van.
Annak sorai a következők:
FROM nginx
RUN rm /usr/share/nginx/html/*
COPY web /usr/share/nginx/html
EXPOSE 80 443
CMD [’’nginx’’, ’’-g’’, ’’daemon off;’’]
3. A saját dockerninx repomra alakítva leírom az ezek után történő varázs sorokat is.
rm –rf dockerngnix
git clone dockerngnix.git
cd dockerngnix
sudo docker image build . –t valami
sudo container run –d –p 80:80 (a konténer build számának az első 4 számjegye)
