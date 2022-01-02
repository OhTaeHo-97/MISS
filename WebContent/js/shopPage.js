/**
 * 
 */

function searchTitle(mcnt) {
	const titleValue = document.getElementById("titleInput").value;
	const device_url = "titleSearch.do/titleInput=" + titleValue + "&category=music&search_cnt=6";
	console.log(device_url);
	location.href = "titleSearch.do/titleInput=" + titleValue + "&category=music&search_cnt=6";
}
