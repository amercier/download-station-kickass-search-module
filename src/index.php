<?
require_once './search.php';

class DownloadStationPlugin {
    public function addResult($title, $download, $size, $datetime, $page, $hash, $seeds, $leechs, $category) {
      echo '<tr>'
        . '<td>' . $title
        . '<td><a href="' . $download . '">' . substr($download, -10) . '</a>'
        . '<td>' . $size
        . '<td>' . $datetime
        . '<td><a href="' . $page . '">' . substr($page, -10) . '</a>'
        . '<td>' . $hash
        . '<td>' . $seeds
        . '<td>' . $leechs
        . '<td>' . $category
      . '</tr>';
    }
}

$searchModule = new DownloadStationKickassSearchModule();

$curl = curl_init();
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$searchModule->prepare($curl, 'interstellar');
$response = curl_exec($curl);
curl_close($curl);

$plugin = new DownloadStationPlugin();

?>
<style>
  table, td {
    border: 1px solid #eee;
  }
</style>

<table>
  <tr>
    <th>title</th>
    <th>download</th>
    <th>size</th>
    <th>datetime</th>
    <th>page</th>
    <th>hash</th>
    <th>seeds</th>
    <th>leechs</th>
    <th>category</th>
  </tr>
  <? $searchModule->parse($plugin, $response); ?>
</table>
