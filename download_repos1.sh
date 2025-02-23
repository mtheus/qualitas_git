#!/bin/bash

# Diretório onde os repositórios serão clonados
TARGET_DIR="repos1"
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Lista de repositórios
REPOS=(
    "git@github.com:apache/ant.git"
    "git@github.com:antlr/antlr3.git"
    "git@github.com:argouml-tigris-org/argouml.git"
    "git@github.com:eclipse/org.aspectj.git"
    "git@github.com:BiglySoftware/BiglyBT.git"
    "git@github.com:apache/xmlgraphics-batik.git"
    "git@github.com:castor-data-binding/castor.git"
    "git@github.com:apache/cayenne.git"
    "git@github.com:checkstyle/checkstyle.git"
    "git@github.com:cobertura/cobertura.git"
    "git@github.com:apache/derby.git"
    "git@github.com:DrJavaAtRice/drjava.git"
    "git@github.com:eclipse/eclipse.platform.git"
    "git@github.com:ArtemAlagizov/emma.git"
    "git@github.com:findbugsproject/findbugs.git"
    "git@github.com:FreeCol/freecol.git"
    "git@github.com:freeplane/freeplane.git"
    "git@github.com:bardsoftware/ganttproject.git"
    "git@github.com:apache/hadoop.git"
    "git@github.com:internetarchive/heritrix3.git"
    "git@github.com:hibernate/hibernate-orm.git"
    "git@github.com:hsqldb/hsqldb.git"
    "git@github.com:HtmlUnit/htmlunit.git"
    "git@github.com:itext/itextpdf.git"
    "git@github.com:TIBCOSoftware/jasperreports.git"
    "git@github.com:jbossas/jboss-eap7.git"
    "git@github.com:jedit/jedit.git"
    "git@github.com:jfree/jfreechart.git"
    "git@github.com:apache/jmeter.git"
    "git@github.com:junit-team/junit4.git"
    "git@github.com:apache/lucene.git"
    "git@github.com:apache/maven.git"
    "git@github.com:apache/netbeans.git"
    "git@github.com:pmd/pmd.git"
    "git@github.com:apache/poi.git"
    "git@github.com:quartz-scheduler/quartz.git"
    "git@github.com:spring-projects/spring-framework.git"
    "git@github.com:apache/struts.git"
    "git@github.com:apache/tomcat.git"
    "git@github.com:apache/velocity-engine.git"
    "git@github.com:Waikato/weka-3.8.git"
    "git@github.com:apache/xalan-java.git"
    "git@github.com:apache/xerces2-j.git"
)

# Clonar repositórios
for REPO in "${REPOS[@]}"; do
    echo "Clonando $REPO ..."
    git clone "$REPO"
done

echo "Todos os repositórios foram clonados!"

