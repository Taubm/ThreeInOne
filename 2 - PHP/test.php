<html>
  <head>
    <title></title>
  </head>
  <body>
    <?php
      class F {
        function __construct($c_name, $c_mdate) {
          $this->name = $c_name;
          $this->mdate = $c_mdate;
        }
        public $name="";
        public $c_mdate="";
      }
      //директория поиска
      $dir = "files/";

      //проверим существование каталога
      if (!file_exists($dir)) echo "Ошибка: каталог не найден."; else {

        //Получим массив с именами файлов   
        $files = scandir($dir);

        $files_ar = array();
        //Заполним массив информацией о файлах: имя и дата изменения, информацию будем хранить в массиве из двух элементов
        foreach ($files as $file) {
          if((preg_match('/^[a-zA-Z0-9]+\.ext$/', $file)) && !(preg_match('/^[a-zA-Z]+\.ext$/', $file)) && !(preg_match('/^[0-9]+\.ext$/', $file))){
            $a = new F ($file, filemtime($dir.$file));
            array_push($files_ar, $a);
          }
        }

        //Проверим, есть ли нужные нам файлы

        $files_count=count($files_ar);

        if ($files_count>0) {
          echo "<br>Найдено файлов, удовлетворяющих условию: ".$files_count."<br><br>";

          //функция для сортировки по дате изменения
          function cmp_dm($a, $b) {
            if ($a->mdate == $b->mdate) return 0;
            return ($a->mdate > $b->mdate) ? -1 : 1;
          }

          //функция для сортировки по имени файла в алфавитном порядке
          function cmp_name($a, $b) {
            return(strnatcmp($a->name,$b->name));
          }

          //вывод имен файлов
          echo "<table border=1 bgcolor=FFFFFF>
          <tr><td>Файлы, отсортированные по имени</td></tr>";


          usort($files_ar, "cmp_name");

          foreach ($files_ar as $key => $val) {
            echo "<tr><td>" . $val->name . "</td></tr>";
          }

          echo "</table>";

          //Выведем имена файлов и время, прошедшее с последнего изменения
          echo "<br><table border=1 bgcolor=FFFFFF>
                <tr><td colspan=2>Файлы, отсортированные по дате изменения</td></tr>
                <tr><td>Имя файла</td><td>Прошло с последнего изменения</td></tr>";

          usort($files_ar, "cmp_dm");
          foreach ($files_ar as $key => $val) {
            echo "<tr><td>".$val->name."</td><td>" . date_diff((new DateTime()), (new DateTime("@".$val->mdate)))->format('%Y лет %M месяцев %D дней %H часов %I минут %S секунд') . "</td></tr>";
          }
          echo "</table>";
        } else echo "Файлов не найдено.";
      }
    ?>


</body>


</html>