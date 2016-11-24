
# toma todos os .ear, .war e .jar da pasta corrente e os decompacta
# para cada pasta resultante, realiza a mesma acao de forma recursiva
# e apaga o arquivo .war/.jar das pastas internas.
# os arquivos originais da pasta onde se iniciou o processo sao preservados
#
function unzipAll {
  startCwd=`pwd`
  for file in `ls | grep .war`; do
    cd "$startCwd";
    echo "descompactando $file";
    unzipWar $file;
  done;

  for file in `ls | grep .ear`; do
    cd "$startCwd";
    echo "descompactando $file";
    unzipEar $file;
  done;

  for file in `ls | grep .jar`; do
    cd "$startCwd";
    echo "descompactando $file";
    unzipJar $file;
  done;

  cd "$startCwd";
}

function unzipEar {
  echo "unzipEar $1";
  file=$1;
  folder="expanded-$1";

  rm -rf $folder;
  mkdir $folder;
  unzip $file -d $folder;
  startCwd=`pwd`;
  cd $folder;
  for war in `ls | grep .war`; do
    unzipWar $war;
    rm -f $war;
  done;
  cd "$startCwd";
}

function unzipWar {
  echo "unzipWar $1";
  file=$1;
  folder="expanded-$1";
  rm -rf $folder;
  mkdir $folder;
  unzip $file -d $folder;
  startCwd=`pwd`;
  cd $folder;
  for jar in `ls | grep .jar`; do
    unzipJar $jar;
    rm -f $jar;
  done;
  cd "$startCwd";
}

function unzipJar {
  echo "unzipJar $1";
  file=$1;
  folder="expanded-$1";
  rm -rf $folder;
  mkdir $folder;
  unzip $file -d $folder;
}

function decompileClassesRecursive {
  echo "cant decompile yet"
  #  jad num-sei-o-que....
}
