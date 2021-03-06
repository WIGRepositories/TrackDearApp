USE [TrackDear]
GO
/****** Object:  StoredProcedure [dbo].[ChangePwd]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[ChangePwd]
GO
/****** Object:  StoredProcedure [dbo].[CheckStatus]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[CheckStatus]
GO
/****** Object:  StoredProcedure [dbo].[CheckStatusDisable]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[CheckStatusDisable]
GO
/****** Object:  StoredProcedure [dbo].[CheckStatusEnable]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[CheckStatusEnable]
GO
/****** Object:  StoredProcedure [dbo].[DisplayAppUsers]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[DisplayAppUsers]
GO
/****** Object:  StoredProcedure [dbo].[DisplayLoc]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[DisplayLoc]
GO
/****** Object:  StoredProcedure [dbo].[DisplayUsers]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[DisplayUsers]
GO
/****** Object:  StoredProcedure [dbo].[EOTPverification]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[EOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[EOTPverificationforAddUsers]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[EOTPverificationforAddUsers]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAppUsers]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[GetAllAppUsers]
GO
/****** Object:  StoredProcedure [dbo].[GetSupervisor]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[GetSupervisor]
GO
/****** Object:  StoredProcedure [dbo].[GetTrackedUsersByMobileNumber]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[GetTrackedUsersByMobileNumber]
GO
/****** Object:  StoredProcedure [dbo].[GetTrackUser]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[GetTrackUser]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdAppusers]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[InsUpdAppusers]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPasswordverification]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[InsUpdDelPasswordverification]
GO
/****** Object:  StoredProcedure [dbo].[MOTPverification]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[MOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[MOTPverificationforAddUsers]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[MOTPverificationforAddUsers]
GO
/****** Object:  StoredProcedure [dbo].[Passwordreset]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[Passwordreset]
GO
/****** Object:  StoredProcedure [dbo].[Passwordverification]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[Passwordverification]
GO
/****** Object:  StoredProcedure [dbo].[RetrivePassword]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[RetrivePassword]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetLocIns]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[Sp_GetLocIns]
GO
/****** Object:  StoredProcedure [dbo].[TrackUserInsUpdDelMOTPverification]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[TrackUserInsUpdDelMOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdAddingUser]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[InsUpdAddingUser]
GO
/****** Object:  StoredProcedure [dbo].[TrackUser]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[TrackUser]
GO
/****** Object:  StoredProcedure [dbo].[ValidateCredentials]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[ValidateCredentials]
GO
/****** Object:  StoredProcedure [dbo].[TrackUserInsUpdDelEOTPverification]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[TrackUserInsUpdDelEOTPverification]
GO
/****** Object:  StoredProcedure [dbo].[InsUpdAddUsers]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[InsUpdAddUsers]
GO
/****** Object:  StoredProcedure [dbo].[sp_Recover_Dropped_Objects]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[sp_Recover_Dropped_Objects]
GO
/****** Object:  StoredProcedure [dbo].[Instracker]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[Instracker]
GO
/****** Object:  StoredProcedure [dbo].[Recover_Dropped_Objects_Proc]    Script Date: 07/08/2017 12:14:13 ******/
DROP PROCEDURE [dbo].[Recover_Dropped_Objects_Proc]
GO
/****** Object:  StoredProcedure [dbo].[Recover_Dropped_Objects_Proc]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Recover_Dropped_Objects_Proc]
@Database_Name NVARCHAR(MAX),
@Date_From DATETIME='2017/01/01',
@Date_To DATETIME ='2017/07/06'
AS
 
DECLARE @Compatibility_Level INT
SELECT @Compatibility_Level=dtb.compatibility_level
FROM
master.sys.databases AS dtb WHERE dtb.name=@Database_Name
 
IF ISNULL(@Compatibility_Level,0)<=80
BEGIN
    RAISERROR('The compatibility level should be equal to or greater SQL SERVER 2005 (90)',16,1)
    RETURN
END
Select Convert(varchar(Max),Substring([RowLog Contents 0],33,LEN([RowLog Contents 0]))) as [Script]
from fn_dblog(NULL,NULL)
Where [Operation]='LOP_DELETE_ROWS' And [Context]='LCX_MARK_AS_GHOST'
And [AllocUnitName]='sys.sysobjvalues.clst'
AND [TRANSACTION ID] IN (SELECT DISTINCT [TRANSACTION ID] FROM    sys.fn_dblog(NULL, NULL) 
WHERE Context IN ('LCX_NULL') AND Operation in ('LOP_BEGIN_XACT')  
And [Transaction Name]='DROPOBJ'
And  CONVERT(NVARCHAR(11),[Begin Time]) BETWEEN @Date_From AND @Date_To)
And Substring([RowLog Contents 0],33,LEN([RowLog Contents 0]))<>0
GO
/****** Object:  StoredProcedure [dbo].[Instracker]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[Instracker]
@flag varchar,
@TrackId int=-1,
@TrackedUser varchar(50) = null,
@Mobilenumber varchar(20),
@EmailId varchar(50) = null,
@Mobileotp varchar(50)=null,
@Emailotp varchar(50)=null,
@CreatedOn datetime=null,
@Mobileotpsenton datetime=null,
@emailsenton datetime=null


AS
BEGIN
select GETDATE()
declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4)
declare @dt datetime

set @dt = GETDATE()

select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from dbo.TrackedUsers where Mobilenumber = @Mobilenumber and EmailId = @EmailId

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
		end
		
	else
    begin
    insert into dbo.TrackedUsers
    ([TrackId],[TrackedUser], [Mobilenumber], 
    [EmailId], [Mobileotp], [Emailotp], [CreatedOn], [Mobileotpsenton],[emailotpsenton])
     values(@TrackId,@TrackedUser,@Mobilenumber,@EmailId,@m,@e,@dt,@dt,@dt)
    
	end
	
end
	


END
GO
/****** Object:  StoredProcedure [dbo].[sp_Recover_Dropped_Objects]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Recover_Dropped_Objects]
    @Database_Name NVARCHAR(MAX),
    @Date_From DATETIME,
    @Date_To DATETIME
AS

DECLARE @Compatibility_Level INT

SELECT @Compatibility_Level=dtb.compatibility_level
FROM master.sys.databases AS dtb WHERE dtb.name=@Database_Name

IF ISNULL(@Compatibility_Level,0)<=80
BEGIN
    RAISERROR('The compatibility level should be equal to or greater SQL SERVER 2005 (90)',16,1)
    RETURN
END

Select [Database Name],Convert(varchar(Max),Substring([RowLog Contents 0],33,LEN([RowLog Contents 0]))) as [Script]
from fn_dblog(NULL,NULL)
Where [Operation]='LOP_DELETE_ROWS' And [Context]='LCX_MARK_AS_GHOST'
And [AllocUnitName]='sys.sysobjvalues.clst'
AND [TRANSACTION ID] IN (SELECT DISTINCT [TRANSACTION ID] FROM    sys.fn_dblog(NULL, NULL)
WHERE Context IN ('LCX_NULL') AND Operation in ('LOP_BEGIN_XACT') 
And [Transaction Name]='DROPOBJ'
And  CONVERT(NVARCHAR(11),[Begin Time]) BETWEEN @Date_From AND @Date_To)
And Substring([RowLog Contents 0],33,LEN([RowLog Contents 0]))<>0
GO
/****** Object:  StoredProcedure [dbo].[InsUpdAddUsers]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[InsUpdAddUsers]
@flag varchar,
@Id int=-1,
@UserName varchar(50),
@Mobilenumber varchar(20),
@Email varchar(50) = null,
@Mobileotp varchar(50)=null,
@Emailotp varchar(50)=null,
@CreatedOn datetime=null,
@Mobileotpsenton datetime=null,
@emailsenton datetime=null,
@statusId int=null,
@Latitude float=null,
@Longitude float=null


AS
BEGIN
select GETDATE()
declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4)
declare @dt datetime

set @dt = GETDATE()

select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from AddUsers where Mobilenumber = @Mobilenumber and Email = @Email

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
		end
		
	else
    begin
    insert into AddUsers
    (UserName, Mobilenumber, Email, Mobileotp, Emailotp, 
    CreatedOn, Mobileotpsenton, emailotpsenton, statusId) 
     values(@UserName,@Mobilenumber,@Email,@m,@e,@dt,@dt,@dt,0)
    
	end
	
	


if @flag='U'
	begin
		Update AddUsers set 
		UserName=@UserName, 
		Email=@Email,
		Latitude=@Latitude,
		Longitude=@Longitude
		where Mobilenumber=@Mobilenumber
	End
	end
END
GO
/****** Object:  StoredProcedure [dbo].[TrackUserInsUpdDelEOTPverification]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TrackUserInsUpdDelEOTPverification]
@flag varchar,@Id int=-1,@EmailId varchar(50),@Emailotp varchar(50),@Mobilenumber varchar(20)
as
begin

declare @cnt int

select @cnt = COUNT(*) from TrackedUsers where EmailId = @EmailId

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from TrackedUsers where EmailId = @EmailId and [Emailotp] = @Emailotp 
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update TrackedUsers set Emailotp  = null where EmailId  = @EmailId  and [Emailotp]  = @Emailotp
     select  TrackedUser, EmailId ,Mobilenumber ,Mobileotp ,Emailotp ,StatusId ,CreatedOn, 
     Mobileotpsenton ,emailotpsenton from TrackedUsers where EmailId  = @EmailId
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[ValidateCredentials]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidateCredentials]
@Mobilenumber varchar(20),@Password varchar(50)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Mobilenumber',16,1);
				return;
   end
   
select @cnt = COUNT(*) from Appusers where Password = @Password

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Password or mobile number',16,1);
				return;
   end
else

begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Password = @Password 
  if @cnt = 1
	begin
	
	select
	[Id]
      ,[Username]
      ,[Email]
      ,[Mobilenumber]    
      ,[StatusId]     
      ,[Firstname]
      ,[lastname]
      ,[AuthTypeId]
      from Appusers where Mobilenumber = @Mobilenumber and Password = @Password   		
	
	end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[TrackUser]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TrackUser]
@Mobilenumber varchar(50)
as
begin
select Username, Mobilenumber, Email from Appusers
where Mobilenumber=@Mobilenumber;
end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdAddingUser]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[InsUpdAddingUser]
@flag varchar,
@Id int=-1,
@UserName varchar(50),
@Mobilenumber varchar(20),
@Email varchar(50) = null,
@Mobileotp varchar(50) = null,
@Emailotp varchar(50) = null,
@CreatedOn datetime=null,
@Mobileotpsenton datetime=null,
@emailsenton datetime=null,
@statusId int=null,
@Latitude float=null,
@OwnerId int,
@Longitude float=null

AS
BEGIN
--select GETDATE()
declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4)
declare @dt datetime

set @dt = GETDATE()

select  @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from Users where Mobilenumber = @Mobilenumber

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
		end
		
	else
    begin
    insert into Users
    (UserName, Mobilenumber, Email, Mobileotp, Emailotp, 
    CreatedOn, Mobileotpsenton, emailotpsenton, statusId,OwnerId)  
     values(@UserName,@Mobilenumber,@Email,@m,@e,@dt,@dt,@dt,0,@OwnerId)
    
    select @m as Mobileotp
	end
	
end
	if @flag='U'
	begin
		Update Users set 
		UserName=@UserName, 
		Email=@Email,
		Latitude=@Latitude,
		Longitude=@Longitude
		where Mobilenumber=@Mobilenumber
	End
	
	if @flag='D'
	begin
		Delete from Users where
		Mobilenumber=@Mobilenumber
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[TrackUserInsUpdDelMOTPverification]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TrackUserInsUpdDelMOTPverification]
@flag varchar,@Id int=-1,@Mobilenumber varchar(20),@Mobileotp varchar(10)=null,
@EmailId varchar(50) =null
as
begin

declare @cnt int

select @cnt = COUNT(*) from TrackedUsers where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and 
  Mobileotp = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update TrackedUsers set Mobileotp = null where Mobilenumber = @Mobilenumber and 
     Mobileotp = @Mobileotp
     select TrackedUser, EmailId, Mobilenumber, Mobileotp ,Emailotp 
     statusId ,CreatedOn ,Mobileotpsenton, emailotpsenton  from 
     TrackedUsers where Mobilenumber = @Mobilenumber
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetLocIns]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_GetLocIns](
@Mobilenumber varchar(50),
@Latitude numeric(10,6),
@Longitude numeric(10,6),
@flag varchar(1)) as
begin
declare @cnt int



if @flag='I'
--------------------------------------------
begin
select @cnt =  COUNT(*) from Users where Mobilenumber = @Mobilenumber 
	

	if @cnt < 1
		begin
				RAISERROR ('No One user with given mobile number',16,1);
				return;	
		end
		else
		begin
----------------------------------------------

Update Users set Latitude=@Latitude,Longitude=@Longitude  
where Mobilenumber=@Mobilenumber


--select  @getdate1 = convert(date,getdate())
--select @gettime1 = convert(time,getdate())

Insert into History(Mobilenumber, Latitude, Longitude, Date, Time) 
select  Mobilenumber, Latitude, Longitude, 
convert(date,GETDATE()) CreatedOn, CONVERT(time,GETDATE()) CreatedOn from Users
where 
Mobilenumber=@Mobilenumber 
---------------------Updated 06-02-2017(Start)----------------
And 
Latitude not in(select top 1 Latitude from History order by Time desc)
or Longitude not in(select top 1 Longitude from History order by Time desc)
-------------------------End----------------------------------
----------------------------------
And
Latitude  in(select  Latitude from Users where Mobilenumber=@Mobilenumber)
or Longitude  in(select  Latitude from Users where Mobilenumber=@Mobilenumber)

---------------------------------

--SELECT TOP 1000 
--      [Mobilenumber]
--      ,[Latitude]
--      ,[Longitude]
--      ,[Date]
--      ,[Time]
--  FROM [TrackDear].[dbo].[History] where Mobilenumber=@Mobilenumber
--select 1
end
	 end	
END

--exec Sp_GetLocIns '8801744404',29.4555,98.5475,'I'
--}
GO
/****** Object:  StoredProcedure [dbo].[RetrivePassword]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetrivePassword]
	-- Add the parameters for the stored procedure here
	@Email varchar(50)
	
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
        
    select a.Mobilenumber,a.Email from Appusers a
    where upper(a.Passwordotp) = upper(Passwordotp)
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[Passwordverification]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Passwordverification]
@Password varchar(50),@Passwordotp varchar(10),@Email varchar(50), @mobileno varchar(15)
as
begin

declare @otp varchar(10) = null

select @otp = @Passwordotp from Appusers where Mobilenumber = @mobileno and Email = @Email 

if @otp is null
begin
  
				RAISERROR ('Invalid mobile number or email address',16,1);
				return;
end
else
begin

  if @otp <> @Passwordotp
  begin
    
					RAISERROR ('Invalid Password OTP',16,1);
					return;
  end
   else
   begin
      update Appusers set Passwordotp  = null,Password = @Password where Mobilenumber = @mobileno and Email = @Email  
     select [Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @mobileno and Email = @Email
  end
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[Passwordreset]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Passwordreset]
@Password varchar(50),
@Passwordotp varchar(10),
@Email varchar(50), 
@Mobilenumber varchar(15)
as
begin

declare @otp int

select @otp = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email 

if @otp = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end
else
begin

  if @otp > @Passwordotp
  begin
    
					RAISERROR ('Invalid Password OTP',16,1);
					return;
  end
   else
   begin
      update Appusers set Passwordotp  = null ,Password = @Password where Mobilenumber = @Mobilenumber and Email = @Email  
     --select [Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
      select 1
  end
 
end
end
GO
/****** Object:  StoredProcedure [dbo].[MOTPverificationforAddUsers]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MOTPverificationforAddUsers]
@Mobilenumber varchar(20),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Users where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from Users where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update Users set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
     --select [Username] ,[Email] ,[Mobilenumber] ,[Mobileotp] ,[Emailotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton]  from Users where Mobilenumber = @Mobilenumber
     select 1
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[MOTPverification]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MOTPverification]
@Mobilenumber varchar(20),@Mobileotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber

if @cnt = 0
begin
  
				RAISERROR ('Invalid mobile number',16,1);
				return;
end
else
begin

  select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid mobile OTP',16,1);
					return;
	end
  else
  begin
     update Appusers set Mobileotp = null where Mobilenumber = @Mobilenumber and [Mobileotp] = @Mobileotp
     --select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from Appusers where Mobilenumber = @Mobilenumber
     select 1
  end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[InsUpdDelPasswordverification]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsUpdDelPasswordverification]
@Mobilenumber varchar(20) = null,
@Email varchar(50) =null
as
begin

declare @cnt int,@p varchar(4)
declare @dt datetime
 
set @dt = GETDATE()
select @p = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))


	select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email=@Email
	
	if @cnt = 0
	begin
	            RAISERROR ('Invalid mobile number or email address',16,1);
				return;	
	end
	else
	begin
	    update dbo.Appusers set [Passwordotp] = @p  where Mobilenumber = @Mobilenumber and Email = @Email
		--select @p
		select 1
	end

end
--exec InsUpdDelPasswordverification '8801051283','layasri.valabhoju@gmail.com'
GO
/****** Object:  StoredProcedure [dbo].[InsUpdAppusers]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[InsUpdAppusers]
@flag varchar,@Id int=-1,@Username varchar(50) = null,@Email varchar(50) = null
,@Mobilenumber varchar(20),@Password varchar(50) = null,@Mobileotp varchar(10) = null
,@Emailotp varchar(10) = null,@Passwordotp varchar(10) = null,@StatusId int = null
,@CreatedOn datetime = null,
@Mobileotpsenton datetime = null,
@emailotpsenton datetime = null,
@noofattempts int = null,
@Firstname varchar(20),@lastname varchar(20),
@AuthTypeId int,@AltPhonenumber varchar(20),
@Altemail varchar(50),@AccountNo varchar(50)
AS
BEGIN

declare @cnt int, @m varchar(4), @p varchar(4),@e varchar(4)
declare @dt datetime
set @dt = GETDATE()

select @m = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))
select @e = replace(CONVERT(VARCHAR(1), GETDATE(), 114),':','')+ CONVERT(VARCHAR(3),DATEPART(millisecond,GETDATE()))+5

	if @flag = 'I'
	begin
	
	select @cnt = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber 
	

	if @cnt > 0
		begin
				RAISERROR ('Already user registered with given mobile number',16,1);
				return;	
		end
		select @cnt = COUNT(*) from Appusers where  Email = @Email
		
		if @cnt > 0
		begin
				RAISERROR ('Already user registered with given Email Address',16,1);
				return;	
		end
	else
    begin
    
	
	insert into dbo.Appusers 
	([Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo] )
	values
	(@Username ,@Email ,@Mobilenumber ,@Password ,@m ,@e ,null ,@StatusId ,@dt ,@dt ,@dt ,0,@Firstname,@lastname,@AuthTypeId,@AltPhonenumber,@Altemail,@AccountNo)
	end
	
	end
	
	
	
	if @flag ='U'
	begin
	select @cnt = COUNT(*) from Appusers where (upper(UserName) = upper(@UserName) or Mobilenumber = @Mobilenumber
	or Email = @Email) and Id <> @Id

	if @cnt = 0
		begin
				RAISERROR ('No user registered with given mobile number',16,1);
				return;
		end
	else
    begin
	
	
	Update dbo.Appusers 
	set [Username]= @Username ,	
	[Email]= @Email,	
	[Password]= @Password,
	[Mobileotp]=@Mobileotp ,
	[Emailotp]= @Emailotp,
	[Passwordotp]= @Passwordotp,
	[StatusId]=@StatusId,
	[CreatedOn]= @CreatedOn,
	[Mobileotpsenton]= @Mobileotpsenton,
	[emailotpsenton]= @emailotpsenton,
	[noofattempts]= @noofattempts,
	[Firstname] =@Firstname,
	[lastname] =@lastname,
	[AuthTypeId] =@AuthTypeId,
	[AltPhonenumber] =@AltPhonenumber,
	[Altemail] =@Altemail,
	[AccountNo] =@AccountNo
	where Mobilenumber = @Mobilenumber 
	
	 end
	
	end
	
	
--	select 1 as Emailotp
   select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts],[Firstname],[lastname],[AuthTypeId],[AltPhonenumber],[Altemail],[AccountNo]  from Appusers where Mobilenumber = @Mobilenumber
   
	

end
GO
/****** Object:  StoredProcedure [dbo].[GetTrackUser]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTrackUser]
@Mobilenumber varchar(50)
as
begin
select Username, Mobilenumber, Email from Appusers
where Mobilenumber=@Mobilenumber;
end
GO
/****** Object:  StoredProcedure [dbo].[GetTrackedUsersByMobileNumber]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTrackedUsersByMobileNumber]
@Mobilenumber varchar(50)
as
begin
select au.Username,au.Mobilenumber 
from Appusers a, Users au 
where au.OwnerId=a.AuthTypeId
and a.Mobilenumber=@Mobilenumber

end
GO
/****** Object:  StoredProcedure [dbo].[GetSupervisor]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetSupervisor] 
as
begin
select a.AuthTypeId,a.Username from Appusers a,Users au 
where a.AuthTypeId=au.OwnerId 
intersect
select a.AuthTypeId,a.Username from Appusers a,Users au 
where a.AuthTypeId=au.OwnerId 
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllAppUsers]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllAppUsers]
as 
begin
	Select *from Appusers
end
GO
/****** Object:  StoredProcedure [dbo].[EOTPverificationforAddUsers]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EOTPverificationforAddUsers]
@Email varchar(50),@Emailotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Users where Email = @Email

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email address',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from Users where Email = @Email and [Emailotp] = @Emailotp 
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update Users set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp
   
     --select [Username] ,[Email] ,[Mobilenumber], [Mobileotp] ,[Emailotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton]   from Users where Email  = @Email and 
     --Emailotp=@Emailotp
     select 1
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[EOTPverification]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EOTPverification]
@Email varchar(50),@Emailotp varchar(10)
as
begin

declare @cnt int

select @cnt = COUNT(*) from Appusers where Email = @Email

if @cnt = 0
   begin
  
				RAISERROR ('Invalid Email address',16,1);
				return;
   end

else

begin

  select @cnt = COUNT(*) from Appusers where Email = @Email and [Emailotp] = @Emailotp 
  if @cnt = 0
	begin
	  
					RAISERROR ('Invalid Email OTP',16,1);
					return;
	end
 
  else
 
   begin
     update Appusers set Emailotp  = null where Email  = @Email  and [Emailotp]  = @Emailotp
   
     --select [Username] ,[Email] ,[Mobilenumber] ,[Password] ,[Mobileotp] ,[Emailotp] ,[Passwordotp] ,[StatusId] ,[CreatedOn] ,[Mobileotpsenton] ,[emailotpsenton] ,[noofattempts]  from Appusers where Email  = @Email
     select 1
   end
 
end

end
GO
/****** Object:  StoredProcedure [dbo].[DisplayUsers]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DisplayUsers]
as
begin
select id,Username,Mobilenumber,Email,statusId from Users
end
GO
/****** Object:  StoredProcedure [dbo].[DisplayLoc]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DisplayLoc]
@Mobilenumber varchar(50)
as
begin
select   h.Latitude, h.Longitude,
h.Date, h.Time from Users au, History h
where au.Mobilenumber=h.Mobilenumber and 
h.Mobilenumber=@Mobilenumber 
end
GO
/****** Object:  StoredProcedure [dbo].[DisplayAppUsers]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DisplayAppUsers]
as 
begin
	select Username,Mobilenumber,Email,StatusId from Appusers
end
GO
/****** Object:  StoredProcedure [dbo].[CheckStatusEnable]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CheckStatusEnable]
@Mobilenumber varchar(50)
as
begin

declare @cnt int

select 
@cnt = 
COUNT(*) from Users where Mobilenumber = @Mobilenumber

if @cnt = 0
   begin
			RAISERROR ('Invalid Mobile Number',16,1);
			return;
   end

else

begin
	select 
	@cnt = 
	COUNT(*) from Users where statusId = 1 and Mobilenumber=@Mobilenumber

  if @cnt > 0
	begin
			RAISERROR ('Already In Tracking',16,1);
			return;
	end
  else
   begin
     update Users set statusId  = 1 where Mobilenumber  = @Mobilenumber 
     and statusId=0
   
   end
   select latitude,longitude from Users where Mobilenumber=@Mobilenumber
end
end
GO
/****** Object:  StoredProcedure [dbo].[CheckStatusDisable]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CheckStatusDisable]
@Mobilenumber varchar(50)
as
begin

declare @cnt int

select 
@cnt = 
COUNT(*) from Users where Mobilenumber = @Mobilenumber

if @cnt = 0
   begin
			RAISERROR ('Invalid Mobile Number',16,1);
			return;
   end

else

begin
	select 
	@cnt = 
	COUNT(*) from Users where statusId = 0 and Mobilenumber=@Mobilenumber

  if @cnt > 0
	begin
			RAISERROR ('Already Disabled',16,1);
			return;
	end
  else
   begin
     update Users set statusId  = 0 where Mobilenumber  = @Mobilenumber 
     and statusId=1
   
   end
   select latitude,longitude from Users where Mobilenumber=@Mobilenumber
end
end
GO
/****** Object:  StoredProcedure [dbo].[CheckStatus]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CheckStatus]
@Mobilenumber varchar(50),
@Status int
as
begin

declare @cnt int
if @Status=1
begin
select 
@cnt = 
COUNT(*) from Users where Mobilenumber = @Mobilenumber

if @cnt = 0
   begin
			RAISERROR ('Invalid Mobile Number',16,1);
			return;
   end

else

begin
	select 
	@cnt = 
	COUNT(*) from Users where statusId = 1 and Mobilenumber=@Mobilenumber

  if @cnt > 0
	begin
			RAISERROR ('Already In Tracking',16,1);
			return;
	end
  else
   begin
     update Users set statusId  = 1 where Mobilenumber  = @Mobilenumber 
     and statusId=0
   
   end
   end
   end
   else
 ----------------------------------------------
 if @cnt = 0
   begin
			RAISERROR ('Invalid Mobile Number',16,1);
			return;
   end

else

begin
	select 
	@cnt = 
	COUNT(*) from Users where statusId = 0 and Mobilenumber=@Mobilenumber

  if @cnt > 0
	begin
			RAISERROR ('Already Disabled',16,1);
			return;
	end
  else
   begin
     update Users set statusId  = 0 where Mobilenumber  = @Mobilenumber 
     and statusId=1
   
   end

 
 end
 
 --select Mobilenumber,latitude,longitude,StatusId from Users where Mobilenumber=@Mobilenumber
 select 1
end
  -----------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[ChangePwd]    Script Date: 07/08/2017 12:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ChangePwd]
@Mobilenumber varchar(15), @Email varchar(50),@Password varchar(50), @NewPassword varchar(50)
as
begin

declare @pwd int

select @pwd = COUNT(*) from Appusers where Mobilenumber = @Mobilenumber and Email = @Email 

if @pwd = 0
begin
  
				RAISERROR ('Mobile number or email address is not Registered',16,1);
				return;
end

  if @pwd > @Password
  begin
    
					RAISERROR ('Invalid Password',16,1);
					return;
										
  end
  else 

begin  
      update Appusers set Password = @NewPassword where Mobilenumber = @Mobilenumber and Email = @Email  
     select [Username] ,[Email] ,[Mobilenumber]  from Appusers where Mobilenumber = @Mobilenumber and Email = @Email
  end

end
GO
