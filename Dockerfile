# Usando a imagem tomcat
FROM tomcat:9.0-jdk8

# Copiando o arquivo WAR para a pasta de implantação do Tomcat
COPY ScadaBR.war /usr/local/tomcat/webapps/

# Expondo a porta 8080 para acesso externo
EXPOSE 8080
