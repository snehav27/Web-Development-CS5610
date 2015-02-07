$(function () {
    function init()
    {
        $(".add-btn").click(addBtnHandler);
        $(".save-btn").click(saveBtnHandler);
        $(".reload-btn").click(reloadBtnHandler);
        $("#loadPageDialog").dialog({
            autoOpen: false,
            modal: true,
            resizable: false,
            buttons: {
                "Load": function () {
                    $("#loadPageDialog").dialog("close");
                  
                },
                "Cancel": function () { $("#loadPageDialog").dialog("close"); }
            },
            open: populatePageList
        });
    }

    
    function populatePageList() {
        var objStr = localStorage.getItem("ide");
        console.log(objStr);
        if (objStr == null)
            return;

        var ide = JSON.parse(objStr);
        var pages = ide.pages;

        var pageListSelector = $("#pageListSelector");
        pageListSelector.empty();

        for (var p in pages) {
            console.log(p);
            var option = $("<option>").append(p);
            pageListSelector.append(option);
        }

    }

    init();

    function reloadBtnHandler() {
        location.reload();
    }

    function renderObjectArray(contentArray) {
        for (var c in contentArray) {
            var obj = contentArray[c];
            var elementType = obj.type;
            var dom = addElementForType(elementType);
            dom.css({
                top: obj.top,
                left: obj.left,
                width: obj.width,
                height: obj.height
            });
        }
    }



    function saveBtnHandler() {
        var elements = $(".ide");
        if (elements.length == 0)
            return;

      

        var objContent = [];

        elements.each(function (index, element)
        {
            element = $(element);

            var html = element.find(".content").html();

            var position = element.position();
            var top = position.top;
            var left = position.left;
            var width = element.outerWidth();
            var height = element.outerHeight();
            var type = null;

            obj = {
                html: html,
                top: top,
                left: left,
                width: width,
                height: height
            };


            if (element.hasClass("youTube"))
            {
                obj.type = "YOU_TUBE";
                obj.src = element.find(".content").attr("src");
            } else if (element.hasClass("h1")) {
                obj.type = "H1";
            } else if (element.hasClass("div")) {
                obj.type = "DIV";
            } else if (element.hasClass("img")) {
                obj.type = "IMG";
                obj.src = element.find(".content").attr("src");
            }

            objContent.push(obj);
        });
        console.log(objContent);
        var heading = prompt("Heading Name Of the Article");
        if (heading == null || heading == "")
            return;
        var objStr = JSON.stringify(objContent);
        console.log(objStr);
        alert();
        getdetails(objStr, heading);
        
    }

    function getdetails(objStr, heading) {

        var url = "http://cs5610-sv27.rhcloud.com/entrynewseditDB?heading=headg&objectStr=objStr";
        url = url.replace("objStr", objStr);
        url = url.replace("headg", heading);
            console.log(url);
            $.get(url).success(function (response) {
                var res = response;
                console.log(res._id);
                if (res._id == null) {


                } else {
                    document.getElementById("displayMessage").innerHTML = "Success fully Saved the editorial page :) !!!";

                }
             

            });
        
    }

    function addBtnHandler()
    {
        var elementType = $(".element-type").val();
        console.log("Adding Element " + elementType);
        addElementForType(elementType);
    }

    function addElementForType(elementType)
    {
        var html = htmlTemplates[elementType];
        var dom = $(html)
            .css({ position: "absolute", top: 100, left: 100, width: 200, height: 100 })
            .click(elementClickHandler);
        $("body").append(dom);
        return dom;
    }

    function elementClickHandler() {
        var element = $(this);
        unselectAllElements(element);
        selectElement(element);
    }

    function unselectAllElements(element) {
        if (element.hasClass("selected"))
            return;

        $(".selected").find(".delete-btn").remove();
        $(".selected").find(".edit-btn").remove();

        $(".selected")
            .css("box-shadow", "0px 0px 0px #888888")
            .css("z-index", 0)
            .draggable("destroy")
            .resizable("destroy")
            .removeClass("selected");

    }

    function selectElement(element) {

        if (element.hasClass("selected"))
            return;

        var deleteBtnHtml = "<button class='delete-btn btn btn-danger'>X</button>";
        var $deleteBtn = $(deleteBtnHtml).click(deleteBtnHandler);

        var editBtnHtml = "<button class='edit-btn btn btn-warning'>...</button>";
        var $editBtn = $(editBtnHtml).click(editBtnHandler);

        element
            .addClass("selected")
            .css("box-shadow", "0px 0px 5px #888888")
            .css("z-index", 1)
            .draggable({ grid: [10, 10] })
            .resizable({ grid: [10, 10], handles: "n, e, s, w, ne, se, sw, nw" })
            .append($deleteBtn)
            .append($editBtn);
    }

    function deleteBtnHandler() {
        var btn = $(this);
        var parentElement = btn.parent();
        parentElement.remove();
    }

    function editBtnHandler() {
        var btn = $(this);
        var parentElement = btn.parent();
        console.log("Editing ");
        console.log(parentElement);
        if (parentElement.hasClass("img")) {
            var url = prompt("Provide Image URL");

            if(url != "" && url != null)
                parentElement.find("img").attr("src", url);
        } else if (parentElement.hasClass("youTube")) {
            var url = prompt("Provide YouTube URL");

            if (url != "" && url != null) {
                var parts = url.split("/");
                var part = parts[parts.length - 1];
                var src = "//www.youtube.com/embed/" + part;
                parentElement.find("iframe").attr("src", src);
            }


        }
    }

    var htmlTemplates = {
        "H1": "<div class='ide h1'><h1 contenteditable='true' class='content'>Heading 1</h1></div>",        
        "DIV": "<div class='ide div'><div contenteditable='true' class='content'>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.</div></div>",
        "IMG": "<div class='ide img'><img class='content' width='100%' height='100%' src='https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSrAWVie6gl6ld3ZtmEKQ40awRCCikA0UYzw-iaRXmDX9BlPaaDhQ'/></div>",
        "YOU_TUBE": '<div class="ide youTube" style="padding:10px"><iframe class="content" width="100%" height="100%" src="//www.youtube.com/embed/NbbIAlI-Vvc" frameborder="0" allowfullscreen></iframe></div>'
    };
});
