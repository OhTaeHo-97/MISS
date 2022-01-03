/**
 * 
 */

function searchMusic() {
	const searchTitle = document.getElementById("searchTitle").value;
	location.href = "titleSearch.do?titleInput=" + searchTitle + "&category=music&search_cnt=8";
}