
var LATELY_VIEW_ITEM_EXPIRATION_DATE = 1
var LATELY_VIEW_ITEM_MAX_SAVE_COUNT = 3
var LATELY_VIEW_ITEM_PAGING_SIZE = 3



function isNull(obj){
	if(obj == '' || obj == null || obj == undefined || obj == NaN || obj == 'null'){
		return true
	}else{
		return false
	}
}

function setLocalStorage(name, obj){
	localStorage.setItem(name, obj)
}

function removeLocalStorage(name){
	localStorage.removeItem(name)
}

function getItemLocalStorage(name){
	return localStorage.getItem(name)
}



function initLatelyViewItemList(){
	
	
	
	if(isNull(getItemLocalStorage('latelyViewItemList'))){
		
		setLocalStorage('latelyViewItemList', null)
		$('ul#latelyViewItemList_ul').append('<li class="latelyViewNoneMSG">なし</li>')
		
	}else{
		
		var latelyViewItemListJson = getItemLocalStorage('latelyViewItemList')
		
		if(latelyViewItemListJson != 'null' || !isNull(latelyViewItemListJson)){
			var nowDate = new Date()
			var latelyViewItemList = JSON.parse(latelyViewItemListJson)
			
			var latelyViewItemListNew = new Array()
			
			for(var i in latelyViewItemList){
				var viewTime = new Date(latelyViewItemList[i].viewTime)
				
				if(nowDate.getTime() < viewTime.getTime()){
					latelyViewItemListNew.push(latelyViewItemList[i])
				}
			}
			
			if(latelyViewItemListNew.length == 0){
				setLocalStorage('latelyViewItemList', null)
			}else{
				setLocalStorage('latelyViewItemList', JSON.stringify(latelyViewItemListNew))
			}
		}
		
		LatelyViewItemRender(1)
	}
	
}




function moveItemViewPage(itemSeq, itemImagePath){
	
	var latelyViewItemListJson = getItemLocalStorage('latelyViewItemList')
	var viewTime = new Date()
	
	if(latelyViewItemListJson == 'null' || isNull(latelyViewItemListJson)){
		
		var latelyViewItemListNew = new Array()
		
		var latelyViewItem = {"itemSeq":itemSeq, "itemImagePath":itemImagePath, "viewTime":viewTime.setDate(viewTime.getDate() + Number(LATELY_VIEW_ITEM_EXPIRATION_DATE))}
		
		latelyViewItemListNew.unshift(latelyViewItem)
		setLocalStorage('latelyViewItemList', JSON.stringify(latelyViewItemListNew))
	}else{
		var latelyViewItemList = JSON.parse(latelyViewItemListJson)
		var isExistsItem = false
		
		breakPoint : for(var i in latelyViewItemList){
			if(Number(latelyViewItemList[i].itemSeq) == Number(itemSeq)){
				isExistsItem = true
				break breakPoint
			}
		}
		
		if(!isExistsItem){
			
			if(latelyViewItemList.length == Number(LATELY_VIEW_ITEM_MAX_SAVE_COUNT))
				latelyViewItemList.pop()
				
			var latelyViewItem = {"itemSeq":itemSeq, "itemImagePath":itemImagePath, "viewTime":viewTime.setDate(viewTime.getDate() + Number(LATELY_VIEW_ITEM_EXPIRATION_DATE))}
			
			latelyViewItemList.unshift(latelyViewItem)
			setLocalStorage('latelyViewItemList', JSON.stringify(latelyViewItemList))
		}
	}
	
	location.href="/roujin/view?sequence="+itemSeq
}




function LatelyViewItemRender(page){
	
	$('ul#latelyViewItemList_ul').empty()
	
	if(getItemLocalStorage('latelyViewItemList') != 'null' || !isNull(getItemLocalStorage('latelyViewItemList'))){
		
		// X
		var latelyViewItemList = JSON.parse(getItemLocalStorage('latelyViewItemList'))
		var length = latelyViewItemList.length
		var maxPage = length / LATELY_VIEW_ITEM_PAGING_SIZE
		
		// X
		$('div#latelyViewItemListPaging_div').css('display','block')
		$('strong#nowLatelyViewItemPage_strong').text(page)
		$('span#totalLatelyViewItemPage_span').text(Math.ceil(maxPage))
		
		/*
		for(var i = ((page-1) * LATELY_VIEW_ITEM_PAGING_SIZE); i  < (page*LATELY_VIEW_ITEM_PAGING_SIZE); i++){
			
			if(!isNull(latelyViewItemList[i])){
				$('ul#latelyViewItemList_ul').append($('<li>').append($('<a>').attr('href','/roujin/view?sequence='+latelyViewItemList[i].itemSeq).append($('<img>').attr('src','/roujin/files/'+latelyViewItemList[i].itemImagePath))))
			}
		}
		*/
		
		for(var i=0; i < length; i++){

			$('ul#latelyViewItemList_ul').append($('<li>').append($('<a>').attr('href','/roujin/view?sequence='+latelyViewItemList[i].itemSeq).append($("<img class='latelyViewImg'>").attr('src','/roujin/files/'+latelyViewItemList[i].itemImagePath))))
	
		}
		
		
		
	}else{
		$('div#latelyViewItemListPaging_div').css('display','none')
	}
}


//X
function latelyViewItemPagingPlusMinus(type){
	
	if(type == 'minus'){
		if(Number($('strong#nowLatelyViewItemPage_strong').text()) > 1){
			$('strong#nowLatelyViewItemPage_strong').text(Number($('strong#nowLatelyViewItemPage_strong').text())-1)
			
			LatelyViewItemRender($('strong#nowLatelyViewItemPage_strong').text())
		}
	}else{
		if(Number($('strong#nowLatelyViewItemPage_strong').text()) < Number($('span#totalLatelyViewItemPage_span').text())){
			$('strong#nowLatelyViewItemPage_strong').text(Number($('strong#nowLatelyViewItemPage_strong').text())+1)
			
			LatelyViewItemRender($('strong#nowLatelyViewItemPage_strong').text())
		}
	}
}


document.addEventListener("DOMContentLoaded", function(){
	

	
	
	initLatelyViewItemList()
	
	
	
	
	
	
})
