function challs_flash_update()
{
        var dv = $("#cidstring").val();
        var a = {};
        a.title = "上传文件";
        a.FormName = "Filedata";
        a.url = "/master/handle/handle.ashx";
        a.parameter = "mod=upload&action=upload&cidstring=" + dv;
        a.typefile = ["图片文件 (*.gif,*.png,*.jpg,*.jpeg,*.bmp)", "*.gif;*.png;*.jpg;*.jpeg;*.bmp", "压缩文件 (*.rar,*.zip,*.7z,*.jar)", "*.rar;*.zip;*.7z;*.jar", "文本文档 (*.txt,*.doc,*.xls,*.ppt,*.docx,*.xlsx,*.pptx,*.pdf)", "*.txt;*.doc;*.xls;*.ppt;*.docx;*.xlsx;*.pptx;*.pdf"];
        a.UpSize = 0;
        a.fileNum = 1;
        a.size = 2;
        a.FormID = ['cidstring'];
        a.autoClose = 1;
        a.CompleteClose = true;
        a.repeatFile = true;
        a.returnServer = true;
        a.MD5File = 0;
        a.loadFileOrder = true;
        a.mixFileNum = 1;
        a.ListShowType = 1;
        a.InfoDownRight = "等待上传：%1%个  已上传：%2%个";
        a.TitleSwitch = false;
        a.ForceFileNum = 0;
        a.autoUpload = false;
        a.adjustOrder = true;
        a.deleteAllShow = true;
        return a;
}

function challs_flash_onComplete(a)
{
        var name = a.fileName;
        var size = a.fileSize;
        var time = a.updateTime;
        var type = a.fileType;
}

function challs_flash_onCompleteData(a)
{
        $("#" + $("#fieldstring").val()).val(a);
        $.pdialog.closeCurrent();
}
function challs_flash_onStart(a)
{
        var name = a.fileName; 
        var size = a.fileSize;
        var type = a.fileType; 
        return true; 
}

function challs_flash_onCompleteAll(a)
{
       
}
function challs_flash_onSelectFile(a)
{
}
function challs_flash_deleteAllFiles()
{
        return confirm("你确定要清空列表吗?");
       
}
function challs_flash_onError(a)
{
        var err = a.textErr; 
        var name = a.fileName; 
        var size = a.fileSize;
        var type = a.fileType; 
}
function challs_flash_FormData(a)
{
}
function challs_flash_style()
{                                                                                        
        var a = {};
        a.backgroundColor = ['#f6f6f6', '#f3f8fd', '#dbe5f1'];    
        a.backgroundLineColor = '#5576b8'; 				
        a.backgroundFontColor = '#066AD1'; 				
        a.backgroundInsideColor = '#FFFFFF'; 				
        a.backgroundInsideLineColor = ['#e5edf5', '#34629e']; 
        a.upBackgroundColor = '#ffffff'; 					
        a.upOutColor = '#000000'; 					
        a.upOverColor = '#FF0000'; 					
        a.downBackgroundColor = '#ffffff'; 				
        a.downOutColor = '#000000'; 					
        a.downOverColor = '#FF0000'; 					
        a.Top_backgroundColor = ['#e0eaf4', '#bcd1ea']; 		
        a.Top_fontColor = '#245891'; 					
        a.button_overColor = ['#FBDAB5', '#f3840d']; 		
        a.button_overLineColor = '#e77702'; 				
        a.button_overFontColor = '#ffffff'; 				
        a.button_outColor = ['#ffffff', '#dde8fe']; 			
        a.button_outLineColor = '#91bdef'; 				
        a.button_outFontColor = '#245891'; 				
        a.List_scrollBarColor = "#000000"				
        a.List_backgroundColor = '#EAF0F8'; 				
        a.List_fontColor = '#333333'; 					
        a.List_LineColor = '#B3CDF1'; 					
        a.List_cancelOverFontColor = '#ff0000'; 			
        a.List_cancelOutFontColor = '#D76500'; 			
        a.List_progressBarLineColor = '#B3CDF1'; 			
        a.List_progressBarBackgroundColor = '#D8E6F7';   		
        a.List_progressBarColor = ['#FFCC00', '#FFFF00']; 	
        a.Err_backgroundColor = '#C0D3EB'; 				
        a.Err_fontColor = '#245891'; 					
        a.Err_shadowColor = '#000000'; 				
        return a;
}
var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
function thisMovie(movieName)
{
        if (isMSIE)
        {
                return window[movieName];
        }
        else
        {
                return document[movieName];
        }
}