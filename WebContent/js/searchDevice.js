/**
 * 
 */

function searchDevice() {
	const searchTitle = document.getElementById("searchTitle").value;
	location.href = "titleSearch.do?titleInput=" + searchTitle + "&category=device&search_cnt=8";
}