/**
 * 
 */

function searchTitle() {
	const titleValue = document.getElementById("titleInput").value;
	const device_url = "titleSearch.do?titleInput=" + titleValue + "&category=device&search_cnt=8";
	console.log(device_url);
	location.href = "titleSearch.do?titleInput=" + titleValue + "&category=device&search_cnt=8";
}
