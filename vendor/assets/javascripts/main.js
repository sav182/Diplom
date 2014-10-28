function jsAddPeopleToContainer(){
    var $addBtn = $(".js_add_people").eq(0);
    var $peopleContainer = $(".js_people_container").eq(0);
    var $poepleHiddenElement = $(".js_people_dom_element").eq(0);
    var htmlStringPeople = '';
    var lastIndex = 0;
    if($poepleHiddenElement.length && $addBtn.length && $peopleContainer.length){
        lastIndex = parseInt($poepleHiddenElement.data("last-index"))
        $addBtn.click(function(){
            htmlStringPeople = $poepleHiddenElement.html();
            htmlStringPeople = htmlStringPeople.replace(/indexWhichWillReplaced/g, lastIndex)
            $peopleContainer.append(htmlStringPeople);
            lastIndex += 1;
            $poepleHiddenElement.data("last-index", lastIndex)
            return false;
        });
    }
}
function __ready(){
    jsAddPeopleToContainer();
    $('.js-choosen').chosen();
}
$(document).on('ready', __ready);
$(document).on('page:load', __ready);