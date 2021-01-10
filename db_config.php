<?PHP
class DBConfig{
  private $dbName="oshopping";
  private $servername = "localhost";
  private $dbUserName="root";
  private $dbPassword="";
  private $pdo;
  function __construct(){

    try {
      $this->pdo = new PDO("mysql:host=$this->servername;dbname=$this->dbName", $this->dbUserName, $this->dbPassword);
  
      $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
    } catch(PDOException $e) {
      echo "Connection failed: " . $e->getMessage();
    }

  }
  
  function connect(){
    return $this->pdo;
  }
  
}


?>















































