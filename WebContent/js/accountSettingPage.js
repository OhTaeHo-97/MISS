/**
 * 
 */

function deleteMem() {
	const id = document.getElementById("member_id").value;
	var form = document.creatElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");
	form.setAttribute("action", "deleteMem.mem");
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("id")
	
	const searchTitle = document.getElementById("searchTitle").value;
	location.href = "titleSearch.do?titleInput=" + searchTitle + "&category=music&search_cnt=8";
}