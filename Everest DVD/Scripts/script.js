window.addEventListener('load', () => {
    console.log('loaded');

    const issueButtons = document.querySelectorAll('.issue_btn');
    const modal = document.querySelector('.modal-popup');
    var activeBtn = null;
    var movieField, copyField, loanBtn, movieID, copyNum, memberID, dateDue;

    const responseField = document.querySelector('#IssueResponse');

    const memberSelect = document.querySelector('.modal-popup #MemberDDL');
    const dateDueSelect = document.querySelector('.modal-popup #DueDateTB');

    //------------Find Copy
    const movieSelect = document.querySelector('#FindMovieDDL');
    const copySelect = document.querySelector('#FindCopyDDL');

    if (memberSelect) {
        memberSelect.addEventListener('change', () => {
            memberID = memberSelect.value;
        });
    }

    if (dateDueSelect) {
        dateDueSelect.addEventListener('change', () => {
            dateDue = dateDueSelect.value;
        });
    }

    if (issueButtons && modal) {
        
        movieField = modal.querySelector('#MovieHdn');
        copyField = modal.querySelector('#CopyHdn');
        loanBtn = modal.querySelector('#IssueBtn');
        memberID = memberSelect.value;
        dateDue = modal.querySelector('#DueDateTB').value;

        modal.querySelector('.cancel_btn').addEventListener('click', cancelOperation);

        issueButtons.forEach(issueBtn => {
            issueBtn.addEventListener('click', showPopup);
        });

        loanBtn.addEventListener('click', issueDVD);
    }

    function showPopup(e) {
        e.preventDefault();

        activeBtn = e.target;

        movieID = e.target.getAttribute('data-movie');
        copyNum = e.target.getAttribute('data-copy');

        let src = e.srcElement;
        let posX = src.getBoundingClientRect().x;
        let posY = src.getBoundingClientRect().y;
        let srcWidth = src.getBoundingClientRect().width;
        let srcHeight = src.getBoundingClientRect().height;

        modal.style.left = getOffsetLeft(activeBtn) - srcWidth - 40 + 'px';
        modal.style.top = getOffsetTop(activeBtn) + srcHeight + 30 + 'px';

        /*modal.style.left = posX - srcWidth - 40 + 'px';
        modal.style.top = posY + srcHeight + 30 + 'px';*/

        movieField.value = movieID;
        copyField.value = copyNum;
        modal.classList.add('show');
    }

    function cancelOperation(e) {
        e.preventDefault();
        hidePopup();
    }

    function hidePopup() {
        responseField.style.display = 'none';
        modal.classList.remove('show');
        activeBtn = null;
    }

    function issueDVD(e) {
        e.preventDefault();

        console.log('clicked');

        let xmlHttp = new XMLHttpRequest();   

        xmlHttp.open('GET', 'issuedvd?movie=' + movieID + '&copy=' + copyNum + "&member=" + memberID + "&dateDue=" + dateDue, true);
        //xmlHttp.open('GET', 'issuedvd?movie=' + movieID + '&copy=' + copyNum, true);
        xmlHttp.send();

        //console.log(movieID);
        //console.log(xmlhttp.responseText);

        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                //alert(xmlHttp.responseText);
                responseField.style.display = 'inline';
                responseField.innerText = xmlHttp.responseText;
            }
        }

        activeBtn.parentElement.innerHTML = '<span>Rented</span>';
        //activeBtn.parentElement.removeChild(activeBtn);

        hidePopup();

    }

    const getOffsetTop = element => {
        let offsetTop = 0;
        while (element) {
            offsetTop += element.offsetTop;
            element = element.offsetParent;
        }
        return offsetTop;
    }

    const getOffsetLeft = element => {
        let offsetLeft = 0;
        while (element) {
            offsetLeft += element.offsetLeft;
            element = element.offsetParent;
        }
        return offsetLeft;
    }


    //-----------------Find Copy

    function ajaxReq() {
        if (window.XMLHttpRequest) {
            return new XMLHttpRequest();
        } else if (window.ActiveXObject) {
            return new ActiveXObject("Microsoft.XMLHTTP");
        } else {
            alert("Browser does not support XMLHTTP.");
            return false;
        }
    }

    if (movieSelect) {
        movieSelect.addEventListener('change', () => {
            console.log('changed' + movieSelect.value);

            copySelect.innerHTML = "";
            
            let xmlHttp = ajaxReq();

            xmlHttp.open('POST', 'DataService.asmx/GetCopies', true);
            //xmlHttp.responseType = 'json';
            xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlHttp.send("movieId=" + movieSelect.value);

            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                    try {
                        var data = JSON.parse(xmlHttp.responseText);
                        console.log(data);
                        let option;

                        for (let i = 0; i < data.length; i++) {
                            option = document.createElement('option');
                            option.text = data[i].copy_num;
                            option.value = data[i].copy_num;
                            copySelect.add(option);
                        }
                    } catch (err) {
                        console.log(err.message + " in " + xmlHttp.responseText);
                        return;
                    }
                }
            }
        });
    }

    if (copySelect) {
        const hiddenField = document.querySelector('#CopyNumHdn');

        copySelect.addEventListener('change', () => {
            console.log('changed');
            hiddenField.value = copySelect.value;
        });
        
    }
});
