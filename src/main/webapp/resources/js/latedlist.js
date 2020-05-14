
var LATELY_VIEW_ITEM_EXPIRATION_DATE = 1
var LATELY_VIEW_ITEM_MAX_SAVE_COUNT = 5
var LATELY_VIEW_ITEM_PAGING_SIZE = 1



function isNull(obj){
	if(obj == '' || obj == null || obj == undefined || obj == NaN){
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
		$('ul#latelyViewItemList_ul').append('<li>最近見た施設なし</li>')
		
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


document.addEventListener("DOMContentLoaded", function(){
	

	
	
	initLatelyViewItemList()
	
	
	
	
	
	
})
