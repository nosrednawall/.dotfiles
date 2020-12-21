#!/bin/sh

instalar_jdk(){
    echo "instalando"
    tar xvzf jdk-*.tar.gz ;
    sudo mv jdk*/ jdk-oracle ;
    sudo cp -rp jdk-oracle /usr/lib/jvm && sudo rm -r jdk-oracle/ ;
    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-oracle/bin/java" 1 ;
    sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-oracle/bin/javac" 1 ;
    sudo update-alternatives --install "/usr/bin/jar" "jar" "/usr/lib/jvm/jdk-oracle/bin/jar" 1 ;
    sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk-oracle/bin/javaws" 1 ;
    sudo update-alternatives --set java /usr/lib/jvm/jdk-oracle/bin/java ;
    sudo update-alternatives --set javac /usr/lib/jvm/jdk-oracle/bin/javac ;
    sudo update-alternatives --set jar /usr/lib/jvm/jdk-oracle/bin/jar ;
    sudo update-alternatives --set javaws /usr/lib/jvm/jdk-oracle/bin/javaws ;

    echo "atualizar profile ? \n 1-sim| ou |0-não \n"
    while :
    do
        read INPUT_RESPOSTA
        case INPUT_RESPOSTA in
            1)
                echo "atualizando profile" ;
                sudo sh -c 'echo "JAVA_HOME=/usr/lib/jvm/jdk-oracle
                PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
                export JAVA_HOME
                export PATH" >> /etc/profile'

                echo "senha root"
                su -c 'source /etc/profile'
                break
                ;;
            *)
                break
                ;;
        esac
    done

    echo "ATALHO
        [Desktop Entry]
        Encoding=UTF-8
        Name=Java
        Comment=Java Control Panel
        Exec=sh '/usr/lib/jvm/jdk-oracle/bin/jcontrol'
        Icon=/usr/lib/jvm/jdk-oracle/jre/lib/desktop/icons/hicolor/48x48/apps/sun-jcontrol.png
        Terminal=false
        Type=Application
        Categories=Application;Settings;Java;X-Red-Hat-Base;X-Ximian-Settings;
        ATALHO" | sudo tee /usr/share/applications/java-control.desktop
    echo "Java Instalado!"
}

remover_jdk(){
    sudo update-alternatives --remove java /usr/lib/jvm/jdk-oracle/bin/java
    sudo update-alternatives --remove javac /usr/lib/jvm/jdk-oracle/bin/javac
    sudo update-alternatives --remove jar /usr/lib/jvm/jdk-oracle/bin/jar
    sudo update-alternatives --remove javaws /usr/lib/jvm/jdk-oracle/bin/javaws
    sudo rm -rf /usr/share/applications/java-control.desktop
    sudo rm -rf /usr/lib/jvm/jdk-oracle/
}


# Programa começa a rodar aqui
sudo apt update && sudo apt install default-jdk
mkdir /tmp/jdk-install ; cd /tmp/jdk-install


echo "Selecione o tipo de pacote que deseja instalar \n 1-tar \n 2-deb \n 3-já baixei o tar \n 4-remover jdk"
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
		echo "tar"
		wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3a%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie;" "https://download.oracle.com/otn-pub/java/jdk/12.0.1+12/69cfe15208a647278a19ef0990eea691/jdk-12.0.1_linux-x64_bin.tar.gz"
		
		instalar_jdk
		
		break
		;;
	2)
		echo "deb"
		wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3a%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk8-downloads-2133151.html; oraclelicense=accept-securebackup-cookie;" "https://download.oracle.com/otn-pub/java/jdk/12.0.1+12/69cfe15208a647278a19ef0990eea691/jdk-12.0.1_linux-x64_bin.deb"
		
		sudo dpkg -i jdk-12.0.1_linux-x64_bin.deb
		
		break
		;;
	3)
        instalar_jdk
        
        break
        ;;
    4)
        remover_jdk

        echo "remova manualmente os alias no profile"
        sudo nano /etc/profile
        break
        ;;
    *) 
        echo "formato inválido"
        ;;
  esac
done









