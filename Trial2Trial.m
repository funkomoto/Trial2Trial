format shortG
PathStr='C:\Users\Dan\Documents\Sutter Lab\Training\MATLAB\qtip\Q2\'; %%File path
textFiles=dir([PathStr '*.log']); %%File Name
for k = 1:length(textFiles) %%Cycles through individual files (k is filenumber
    textFilename = [PathStr 'q' num2str(k) '.log']; 
    fid = fopen(textFilename,'rt'); %%Opens file
    if exist(textFilename, 'file') == 0 %Checks if the file exists
        MyDataParam(:,k) = NaN;
        MyDataParam(:,k) = NaN;
        continue;
    end
    notfound1 = 1;
    notfound2 = 1;
    endfile = 0;
    while ~feof(fid) %%cycles through lines in individual file
        fidLine = fgetl(fid); %%Get next line in individual file
        if contains(fidLine,'payhvalue	') 
            payhvalue = getNumber2endnogetl('payhvalue',fidLine);
            qtip.payhvalue = payhvalue;
            MyDataParam(1,k) = str2num(payhvalue);

        elseif contains(fidLine,'ythreshinner	')
            ythreshinner = getNumber2endnogetl('ythreshinner',fidLine);
            MyDataParam(2,k) = str2num(ythreshinner);

        elseif contains(fidLine,'ythreshouter	')
            ythreshouter = getNumber2endnogetl('ythreshouter',fidLine);
            MyDataParam(3,k) = str2num(ythreshouter);

        elseif contains(fidLine,'ythreshinnnerinc	')
            ythreshinnnerinc = getNumber2endnogetl('ythreshinnerinc',fidLine);
            MyDataParam(4,k) = str2num(ythreshinnnerinc);

        elseif contains(fidLine,'ythreshouterinc	')
            ythreshouterinc = getNumber2endnogetl('ythreshouterinc',fidLine);
            MyDataParam(5,k) = str2num(ythreshouterinc);

        elseif contains(fidLine,'ythreshoutermin	')
            ythreshoutermin = getNumber2endnogetl('ythreshoutermin',fidLine);
            MyDataParam(8,k) = str2num(ythreshoutermin);

        elseif contains(fidLine,'xthreshouter	')
            xthreshouter = getNumber2endnogetl('xthreshouter',fidLine);
            MyDataParam(9,k) = str2num(xthreshouter);

        elseif contains(fidLine,'xthreshinner	')
            xthreshinner = getNumber2endnogetl('xthreshinner',fidLine);
            MyDataParam(10,k) = str2num(xthreshinner);

        elseif contains(fidLine,'xthreshouterinc	')
            xthreshouterinc = getNumber2endnogetl('xthreshouterinc',fidLine);
            MyDataParam(11,k) = str2num(xthreshouterinc);

        elseif contains(fidLine,'xthreshinnerinc	')
            xthreshinnerinc = getNumber2endnogetl('xthreshinnerinc',fidLine);
            MyDataParam(12,k) = str2num(xthreshinnerinc);

        elseif contains(fidLine,'xthreshoutermax	')
            xthreshoutermax = getNumber2endnogetl('xthreshoutermax',fidLine);
            MyDataParam(13,k) = str2num(xthreshoutermax);

        elseif contains(fidLine,'contreinfto	')
            contreinfto = getNumber2endnogetl('contreinfto',fidLine);
            MyDataParam(14,k) = str2num(contreinfto);

        elseif contains(fidLine,'intpenalty	')
            intpenalty = getNumber2endnogetl('intpenalty',fidLine);
            MyDataParam(15,k) = str2num(intpenalty);

        elseif contains(fidLine,'contreinfdelay	')
            contreinfdelay = getNumber2endnogetl('contreinfdelay',fidLine);
            MyDataParam(16,k) = str2num(contreinfdelay);

        elseif contains(fidLine,'contreinfdelayinc	')
            contreinfdelayinc = getNumber2endnogetl('contreinfdelayinc',fidLine);
            MyDataParam(17,k) = str2num(contreinfdelayinc);

        elseif contains(fidLine,'contreinfdelaymax	')
            contreinfdelaymax = getNumber2endnogetl('contreinfdelaymax',fidLine);
            MyDataParam(18,k) = str2num(contreinfdelaymax);

        elseif contains(fidLine,'contreinfdelaymin	')
            contreinfdelaymin = getNumber2endnogetl('contreinfdelaymin',fidLine);
            MyDataParam(20,k) = str2num(contreinfdelaymin);
            
        elseif contains(fidLine,'errorless	')
            errorless = getNumber2endnogetl('errorless',fidLine);
            MyDataParam(21,k) = str2num(errorless);
            
        elseif contains(fidLine,'respwindow	')
            respwindow = getNumber2endnogetl('respwindow',fidLine);
            MyDataParam(22,k) = str2num(respwindow);
            
        elseif contains(fidLine,'miniti	')
            miniti = getNumber2endnogetl('miniti',fidLine);
            MyDataParam(23,k) = str2num(miniti);
            
        elseif contains(fidLine,'trialonsetdelay	')
            trialonsetdelay = getNumber2endnogetl('trialonsetdelay',fidLine);
            MyDataParam(24,k) = str2num(trialonsetdelay);
            
        elseif contains(fidLine,' number of wrong-axis interrupts ') %%Pulls out three numbers (rewards given, wrong-axis interrupts and delay interrupts)
            RewardsLine = getNumbernogetl(' is ',',',fidLine);
            MyDataParam(25,k) = RewardsLine(1); %Rewards Given
            MyDataParam(26,k) = RewardsLine(2); %WrongAxisInterrupts
            MyDataParam(27,k) = RewardsLine(3); %DelayInterrupts
            
        elseif contains (fidLine,'Final Up/Down inner threshold is')
            summline2 = getNumber(' is ',' degrees',fidLine);
            [UD,LR] = strtok(summline2,' ');
            [UpDownInnerThreshFirst,UpDownInnerThreshSecond] = strtok(UD,'/');
            [LRInnerThreshFirst,LRInnerThreshSecond] = strtok(LR,'/');
            UpDownInnerThreshSecond = UpDownInnerThreshSecond(2:end);
            LRInnerThreshSecond = LRInnerThreshSecond(2:end);
            MyDataParam(28,k) = str2num(UpDownInnerThreshFirst);
            MyDataParam(29,k) = str2num(UpDownInnerThreshSecond);
            MyDataParam(30,k) = str2num(LRInnerThreshFirst);
            MyDataParam(31,k) = str2num(LRInnerThreshSecond);
            
        elseif contains (fidLine,'Final Up/Down outer threshold is')
            summline3 = getNumber(' is ',' degrees',fidLine);
            [UD3,LR3] = strtok(summline3,' ');
            [UpDownOuterThreshFirst,UpDownOuterThreshSecond] = strtok(UD3,'/');
            [LROuterThreshFirst,LROuterThreshSecond] = strtok(LR3,'/');
            LROuterThreshSecond = LROuterThreshSecond(2:end);
            UpDownOuterThreshSecond = UpDownOuterThreshSecond(2:end);
            MyDataParam(32,k) = str2num(UpDownOuterThreshFirst);
            MyDataParam(33,k) = str2num(UpDownOuterThreshSecond);
            MyDataParam(34,k) = str2num(LROuterThreshFirst);
            MyDataParam(35,k) = str2num(LROuterThreshSecond);
            
        elseif contains (fidLine,'Final required delay is ')
            FinalReqDelay = getNumbernogetl(' is ', ' seconds', fidLine);
            MyDataParam(36,k) = FinalReqDelay;
            
        elseif contains (fidLine,'Total Perfect Trials (hit before error = ')
            totalerrors = getNumbernogetl('Total errors = ',' (up = ',fidLine,1);
            summlineup = getNumbernogetl(' (up = ',', down = ',fidLine);
            summlinedown = getNumbernogetl(', down = ',')',fidLine);
            perfecttrials = getNumbernogetl('(hit before error = ',' (up = ',fidLine,2);
            MyDataParam(37,k) = totalerrors;
            MyDataParam(38,k) = summlineup(1);
            MyDataParam(39,k) = summlinedown(1);
            MyDataParam(40,k) = perfecttrials;
            MyDataParam(41,k) = summlineup(2);
            MyDataParam(42,k) = summlinedown(2);
            
        elseif contains (fidLine,' overall) has been completed.  Response Window is ')
            trialnumber = getNumbernogetl(' (',' overall) has been completed.  ',fidLine);
            responsewindow = getNumbernogetl('Response Window is ','. Total accuracy is ',fidLine);
            accuracy = getNumbernogetl('Total accuracy is ','.  Number of Interrupts is ',fidLine);
            interrupts = getNumber2endnogetl('Number of Interrupts is ',fidLine);
            MyDataParam(43,k) = trialnumber;
            MyDataParam(44,k) = responsewindow;
            MyDataParam(45,k) = accuracy;
            MyDataParam(46,k) = str2num(interrupts);
        elseif contains (fidLine,'Up Targets = ')
            uptargets = getNumbernogetl('Up Targets = ','	Hits ',fidLine);
            hits1 = getNumbernogetl('	Hits = ','		Misses = ',fidLine);
            misses1 = getNumbernogetl('		Misses = ','		No Response = ',fidLine);
            noresponse1 = getNumbernogetl('		No Response = ','		Up Accuracy = ',fidLine);
            upaccuracy = getNumber2endnogetl('		Up Accuracy = ',fidLine);
            MyDataParam(47,k) = uptargets;
            MyDataParam(48,k) = hits1;
            MyDataParam(49,k) = misses1;
            MyDataParam(50,k) = noresponse1;
            MyDataParam(51,k) = str2num(upaccuracy);
        elseif contains (fidLine,'Down Targets = ')
            downtargets = getNumbernogetl('Down Targets = ','Hits ',fidLine);
            hits2 = getNumbernogetl('	Hits = ','		Misses = ',fidLine);
            misses2 = getNumbernogetl('		Misses = ','		No Response = ',fidLine);
            noresponse2 = getNumbernogetl('		No Response = ','		Down Accuracy = ',fidLine);
            downaccuracy = getNumber2endnogetl('		Down Accuracy = ',fidLine);
            MyDataParam(52,k) = uptargets;
            MyDataParam(53,k) = hits2;
            MyDataParam(54,k) = misses2;
            MyDataParam(55,k) = noresponse2;
            MyDataParam(56,k) = str2num(downaccuracy);
        end
    end
    fclose(fid);
end

numfiles = size(MyDataParam);
MyDataParam
%%Data Analysis

% Plot 1
% notfound = 1;
% figure
% subplot(2,1,1)
% scatter(MyData2(15,35:end),MyData2(22,35:end))
% title('Interrupt Penalty vs Wrong Axis interrupts');
% xlabel('Interrupt Penalty');
% ylabel('Wrong Axis Interrupt');
% 
% subplot(2,1,2)
% scatter(MyData2(16,35:end),MyData2(22,35:end));
% title('Continuous Reinforcement Delay vs Wrong Axis Interrupt');
% xlabel('Continuous Reinforcement Delay');
% ylabel('Wrong Axis Interrupt');

function [GotNumber] = getNumber(SPosition,EPosition,fid)
GotNumber = '';
if isempty(fid)
else
    StartPos = strfind(fid,SPosition);
    EndPos = strfind(fid,EPosition);
    for k = 1:length(StartPos)
        GotNumber = [GotNumber, ' ', fid((StartPos(k)+length(SPosition)):(EndPos(k)-1))];
    end
end
end
function [GotNumber] = getNumber2end(SPosition,fid)
    fidLine = fgetl(fid);
    if isempty(fidLine)
        GotNumber = [];
    else
        StartPos = strfind(fidLine, SPosition);
        GotNumber = fidLine((StartPos+length(SPosition)):end);
    end
end
function [GotNumber] = getNumbernogetl(SPosition,EPosition,fidLine,n)
if isempty(fidLine)
else
    StartPos = strfind(fidLine,SPosition);
    EndPos = strfind(fidLine,EPosition);
    if length(StartPos) > length(EndPos)
        EndPos(end+1) = (length(fidLine)+1);
    elseif (length(StartPos) < length(EndPos))
        EndPos = EndPos(n);
    end
    GotNumber = [length(StartPos)];
    for j = 1:length(StartPos)
        GotNumber(j) = [str2num(fidLine((StartPos(j)+length(SPosition)):(EndPos(j)-1)))];
    end
end
end
function [GotNumber] = getNumber2endnogetl(SPosition,fidLine)
if isempty(fidLine)
    GotNumber = '';
else
    StartPos = strfind(fidLine, SPosition);
    if fidLine(end) == '.'
        StartPos = (StartPos - 1);
    end
    GotNumber = fidLine((StartPos+length(SPosition)+1):end);
end
end

%Notes
%To Do
    %Turn variables into structures
        %Add info such as param file name, trial number, data type, etc.
    %Add more graphs
