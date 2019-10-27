﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.17929
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Laquev_Time_Sheet_Management
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="Laquev_timesheet_management")]
	public partial class LTSMDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InserttblJob_Title(tblJob_Title instance);
    partial void UpdatetblJob_Title(tblJob_Title instance);
    partial void DeletetblJob_Title(tblJob_Title instance);
    partial void InserttblStaff_info(tblStaff_info instance);
    partial void UpdatetblStaff_info(tblStaff_info instance);
    partial void DeletetblStaff_info(tblStaff_info instance);
    partial void InsertAuthenticate_user(Authenticate_user instance);
    partial void UpdateAuthenticate_user(Authenticate_user instance);
    partial void DeleteAuthenticate_user(Authenticate_user instance);
    partial void InserttblTime_Record(tblTime_Record instance);
    partial void UpdatetblTime_Record(tblTime_Record instance);
    partial void DeletetblTime_Record(tblTime_Record instance);
    #endregion
		
		public LTSMDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["Laquev_timesheet_managementConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public LTSMDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public LTSMDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public LTSMDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public LTSMDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<tblJob_Title> tblJob_Titles
		{
			get
			{
				return this.GetTable<tblJob_Title>();
			}
		}
		
		public System.Data.Linq.Table<tblStaff_info> tblStaff_infos
		{
			get
			{
				return this.GetTable<tblStaff_info>();
			}
		}
		
		public System.Data.Linq.Table<Authenticate_user> Authenticate_users
		{
			get
			{
				return this.GetTable<Authenticate_user>();
			}
		}
		
		public System.Data.Linq.Table<tblTime_Record> tblTime_Records
		{
			get
			{
				return this.GetTable<tblTime_Record>();
			}
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.report")]
		public ISingleResult<reportResult> report()
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())));
			return ((ISingleResult<reportResult>)(result.ReturnValue));
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tblJob_Title")]
	public partial class tblJob_Title : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Job_id;
		
		private string _Job_name;
		
		private decimal _Nakfa_per_hr;
		
		private string _Remark;
		
		private EntitySet<tblStaff_info> _tblStaff_infos;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnJob_idChanging(int value);
    partial void OnJob_idChanged();
    partial void OnJob_nameChanging(string value);
    partial void OnJob_nameChanged();
    partial void OnNakfa_per_hrChanging(decimal value);
    partial void OnNakfa_per_hrChanged();
    partial void OnRemarkChanging(string value);
    partial void OnRemarkChanged();
    #endregion
		
		public tblJob_Title()
		{
			this._tblStaff_infos = new EntitySet<tblStaff_info>(new Action<tblStaff_info>(this.attach_tblStaff_infos), new Action<tblStaff_info>(this.detach_tblStaff_infos));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Job_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int Job_id
		{
			get
			{
				return this._Job_id;
			}
			set
			{
				if ((this._Job_id != value))
				{
					this.OnJob_idChanging(value);
					this.SendPropertyChanging();
					this._Job_id = value;
					this.SendPropertyChanged("Job_id");
					this.OnJob_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Job_name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Job_name
		{
			get
			{
				return this._Job_name;
			}
			set
			{
				if ((this._Job_name != value))
				{
					this.OnJob_nameChanging(value);
					this.SendPropertyChanging();
					this._Job_name = value;
					this.SendPropertyChanged("Job_name");
					this.OnJob_nameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Nakfa_per_hr", DbType="Money NOT NULL")]
		public decimal Nakfa_per_hr
		{
			get
			{
				return this._Nakfa_per_hr;
			}
			set
			{
				if ((this._Nakfa_per_hr != value))
				{
					this.OnNakfa_per_hrChanging(value);
					this.SendPropertyChanging();
					this._Nakfa_per_hr = value;
					this.SendPropertyChanged("Nakfa_per_hr");
					this.OnNakfa_per_hrChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Remark", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string Remark
		{
			get
			{
				return this._Remark;
			}
			set
			{
				if ((this._Remark != value))
				{
					this.OnRemarkChanging(value);
					this.SendPropertyChanging();
					this._Remark = value;
					this.SendPropertyChanged("Remark");
					this.OnRemarkChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tblJob_Title_tblStaff_info", Storage="_tblStaff_infos", ThisKey="Job_id", OtherKey="Jop_id")]
		public EntitySet<tblStaff_info> tblStaff_infos
		{
			get
			{
				return this._tblStaff_infos;
			}
			set
			{
				this._tblStaff_infos.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_tblStaff_infos(tblStaff_info entity)
		{
			this.SendPropertyChanging();
			entity.tblJob_Title = this;
		}
		
		private void detach_tblStaff_infos(tblStaff_info entity)
		{
			this.SendPropertyChanging();
			entity.tblJob_Title = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tblStaff_info")]
	public partial class tblStaff_info : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Staff_id;
		
		private string _Fname;
		
		private string _Lname;
		
		private char _Sex;
		
		private decimal _Age;
		
		private string _Address;
		
		private System.Nullable<int> _Phone_number;
		
		private System.DateTime _Join_date;
		
		private string _Profession;
		
		private int _Jop_id;
		
		private string _Del_status;
		
		private int _Hrs_per_day;
		
		private EntitySet<tblTime_Record> _tblTime_Records;
		
		private EntityRef<tblJob_Title> _tblJob_Title;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnStaff_idChanging(int value);
    partial void OnStaff_idChanged();
    partial void OnFnameChanging(string value);
    partial void OnFnameChanged();
    partial void OnLnameChanging(string value);
    partial void OnLnameChanged();
    partial void OnSexChanging(char value);
    partial void OnSexChanged();
    partial void OnAgeChanging(decimal value);
    partial void OnAgeChanged();
    partial void OnAddressChanging(string value);
    partial void OnAddressChanged();
    partial void OnPhone_numberChanging(System.Nullable<int> value);
    partial void OnPhone_numberChanged();
    partial void OnJoin_dateChanging(System.DateTime value);
    partial void OnJoin_dateChanged();
    partial void OnProfessionChanging(string value);
    partial void OnProfessionChanged();
    partial void OnJop_idChanging(int value);
    partial void OnJop_idChanged();
    partial void OnDel_statusChanging(string value);
    partial void OnDel_statusChanged();
    partial void OnHrs_per_dayChanging(int value);
    partial void OnHrs_per_dayChanged();
    #endregion
		
		public tblStaff_info()
		{
			this._tblTime_Records = new EntitySet<tblTime_Record>(new Action<tblTime_Record>(this.attach_tblTime_Records), new Action<tblTime_Record>(this.detach_tblTime_Records));
			this._tblJob_Title = default(EntityRef<tblJob_Title>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Staff_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int Staff_id
		{
			get
			{
				return this._Staff_id;
			}
			set
			{
				if ((this._Staff_id != value))
				{
					this.OnStaff_idChanging(value);
					this.SendPropertyChanging();
					this._Staff_id = value;
					this.SendPropertyChanged("Staff_id");
					this.OnStaff_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Fname", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Fname
		{
			get
			{
				return this._Fname;
			}
			set
			{
				if ((this._Fname != value))
				{
					this.OnFnameChanging(value);
					this.SendPropertyChanging();
					this._Fname = value;
					this.SendPropertyChanged("Fname");
					this.OnFnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Lname", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Lname
		{
			get
			{
				return this._Lname;
			}
			set
			{
				if ((this._Lname != value))
				{
					this.OnLnameChanging(value);
					this.SendPropertyChanging();
					this._Lname = value;
					this.SendPropertyChanged("Lname");
					this.OnLnameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Sex", DbType="Char(1) NOT NULL")]
		public char Sex
		{
			get
			{
				return this._Sex;
			}
			set
			{
				if ((this._Sex != value))
				{
					this.OnSexChanging(value);
					this.SendPropertyChanging();
					this._Sex = value;
					this.SendPropertyChanged("Sex");
					this.OnSexChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Age", DbType="Decimal(3,0) NOT NULL")]
		public decimal Age
		{
			get
			{
				return this._Age;
			}
			set
			{
				if ((this._Age != value))
				{
					this.OnAgeChanging(value);
					this.SendPropertyChanging();
					this._Age = value;
					this.SendPropertyChanged("Age");
					this.OnAgeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Address", DbType="VarChar(150)")]
		public string Address
		{
			get
			{
				return this._Address;
			}
			set
			{
				if ((this._Address != value))
				{
					this.OnAddressChanging(value);
					this.SendPropertyChanging();
					this._Address = value;
					this.SendPropertyChanged("Address");
					this.OnAddressChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Phone_number", DbType="Int")]
		public System.Nullable<int> Phone_number
		{
			get
			{
				return this._Phone_number;
			}
			set
			{
				if ((this._Phone_number != value))
				{
					this.OnPhone_numberChanging(value);
					this.SendPropertyChanging();
					this._Phone_number = value;
					this.SendPropertyChanged("Phone_number");
					this.OnPhone_numberChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Join_date", DbType="Date NOT NULL")]
		public System.DateTime Join_date
		{
			get
			{
				return this._Join_date;
			}
			set
			{
				if ((this._Join_date != value))
				{
					this.OnJoin_dateChanging(value);
					this.SendPropertyChanging();
					this._Join_date = value;
					this.SendPropertyChanged("Join_date");
					this.OnJoin_dateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Profession", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Profession
		{
			get
			{
				return this._Profession;
			}
			set
			{
				if ((this._Profession != value))
				{
					this.OnProfessionChanging(value);
					this.SendPropertyChanging();
					this._Profession = value;
					this.SendPropertyChanged("Profession");
					this.OnProfessionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Jop_id", DbType="Int NOT NULL")]
		public int Jop_id
		{
			get
			{
				return this._Jop_id;
			}
			set
			{
				if ((this._Jop_id != value))
				{
					if (this._tblJob_Title.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnJop_idChanging(value);
					this.SendPropertyChanging();
					this._Jop_id = value;
					this.SendPropertyChanged("Jop_id");
					this.OnJop_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Del_status", DbType="VarChar(50)")]
		public string Del_status
		{
			get
			{
				return this._Del_status;
			}
			set
			{
				if ((this._Del_status != value))
				{
					this.OnDel_statusChanging(value);
					this.SendPropertyChanging();
					this._Del_status = value;
					this.SendPropertyChanged("Del_status");
					this.OnDel_statusChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Hrs_per_day", DbType="Int NOT NULL")]
		public int Hrs_per_day
		{
			get
			{
				return this._Hrs_per_day;
			}
			set
			{
				if ((this._Hrs_per_day != value))
				{
					this.OnHrs_per_dayChanging(value);
					this.SendPropertyChanging();
					this._Hrs_per_day = value;
					this.SendPropertyChanged("Hrs_per_day");
					this.OnHrs_per_dayChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tblStaff_info_tblTime_Record", Storage="_tblTime_Records", ThisKey="Staff_id", OtherKey="Staff_id")]
		public EntitySet<tblTime_Record> tblTime_Records
		{
			get
			{
				return this._tblTime_Records;
			}
			set
			{
				this._tblTime_Records.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tblJob_Title_tblStaff_info", Storage="_tblJob_Title", ThisKey="Jop_id", OtherKey="Job_id", IsForeignKey=true)]
		public tblJob_Title tblJob_Title
		{
			get
			{
				return this._tblJob_Title.Entity;
			}
			set
			{
				tblJob_Title previousValue = this._tblJob_Title.Entity;
				if (((previousValue != value) 
							|| (this._tblJob_Title.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._tblJob_Title.Entity = null;
						previousValue.tblStaff_infos.Remove(this);
					}
					this._tblJob_Title.Entity = value;
					if ((value != null))
					{
						value.tblStaff_infos.Add(this);
						this._Jop_id = value.Job_id;
					}
					else
					{
						this._Jop_id = default(int);
					}
					this.SendPropertyChanged("tblJob_Title");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_tblTime_Records(tblTime_Record entity)
		{
			this.SendPropertyChanging();
			entity.tblStaff_info = this;
		}
		
		private void detach_tblTime_Records(tblTime_Record entity)
		{
			this.SendPropertyChanging();
			entity.tblStaff_info = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Authenticate_user")]
	public partial class Authenticate_user : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ID;
		
		private string _Username;
		
		private string _Password;
		
		private string _Role;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(int value);
    partial void OnIDChanged();
    partial void OnUsernameChanging(string value);
    partial void OnUsernameChanged();
    partial void OnPasswordChanging(string value);
    partial void OnPasswordChanged();
    partial void OnRoleChanging(string value);
    partial void OnRoleChanged();
    #endregion
		
		public Authenticate_user()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ID", AutoSync=AutoSync.Always, DbType="Int NOT NULL IDENTITY", IsDbGenerated=true)]
		public int ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Username", DbType="VarChar(50) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string Username
		{
			get
			{
				return this._Username;
			}
			set
			{
				if ((this._Username != value))
				{
					this.OnUsernameChanging(value);
					this.SendPropertyChanging();
					this._Username = value;
					this.SendPropertyChanged("Username");
					this.OnUsernameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Password", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Password
		{
			get
			{
				return this._Password;
			}
			set
			{
				if ((this._Password != value))
				{
					this.OnPasswordChanging(value);
					this.SendPropertyChanging();
					this._Password = value;
					this.SendPropertyChanged("Password");
					this.OnPasswordChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Role", DbType="VarChar(50)")]
		public string Role
		{
			get
			{
				return this._Role;
			}
			set
			{
				if ((this._Role != value))
				{
					this.OnRoleChanging(value);
					this.SendPropertyChanging();
					this._Role = value;
					this.SendPropertyChanged("Role");
					this.OnRoleChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tblTime_Record")]
	public partial class tblTime_Record : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Id;
		
		private int _Staff_id;
		
		private System.DateTime _Date;
		
		private System.TimeSpan _Time;
		
		private string _Week_id;
		
		private string _Day_status;
		
		private string _Status;
		
		private System.Nullable<double> _Total_per_day;
		
		private EntityRef<tblStaff_info> _tblStaff_info;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnStaff_idChanging(int value);
    partial void OnStaff_idChanged();
    partial void OnDateChanging(System.DateTime value);
    partial void OnDateChanged();
    partial void OnTimeChanging(System.TimeSpan value);
    partial void OnTimeChanged();
    partial void OnWeek_idChanging(string value);
    partial void OnWeek_idChanged();
    partial void OnDay_statusChanging(string value);
    partial void OnDay_statusChanged();
    partial void OnStatusChanging(string value);
    partial void OnStatusChanged();
    partial void OnTotal_per_dayChanging(System.Nullable<double> value);
    partial void OnTotal_per_dayChanged();
    #endregion
		
		public tblTime_Record()
		{
			this._tblStaff_info = default(EntityRef<tblStaff_info>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this.OnIdChanging(value);
					this.SendPropertyChanging();
					this._Id = value;
					this.SendPropertyChanged("Id");
					this.OnIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Staff_id", DbType="Int NOT NULL")]
		public int Staff_id
		{
			get
			{
				return this._Staff_id;
			}
			set
			{
				if ((this._Staff_id != value))
				{
					if (this._tblStaff_info.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnStaff_idChanging(value);
					this.SendPropertyChanging();
					this._Staff_id = value;
					this.SendPropertyChanged("Staff_id");
					this.OnStaff_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Date", DbType="Date NOT NULL")]
		public System.DateTime Date
		{
			get
			{
				return this._Date;
			}
			set
			{
				if ((this._Date != value))
				{
					this.OnDateChanging(value);
					this.SendPropertyChanging();
					this._Date = value;
					this.SendPropertyChanged("Date");
					this.OnDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Time", DbType="Time NOT NULL")]
		public System.TimeSpan Time
		{
			get
			{
				return this._Time;
			}
			set
			{
				if ((this._Time != value))
				{
					this.OnTimeChanging(value);
					this.SendPropertyChanging();
					this._Time = value;
					this.SendPropertyChanged("Time");
					this.OnTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Week_id", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string Week_id
		{
			get
			{
				return this._Week_id;
			}
			set
			{
				if ((this._Week_id != value))
				{
					this.OnWeek_idChanging(value);
					this.SendPropertyChanging();
					this._Week_id = value;
					this.SendPropertyChanged("Week_id");
					this.OnWeek_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Day_status", DbType="VarChar(30) NOT NULL", CanBeNull=false)]
		public string Day_status
		{
			get
			{
				return this._Day_status;
			}
			set
			{
				if ((this._Day_status != value))
				{
					this.OnDay_statusChanging(value);
					this.SendPropertyChanging();
					this._Day_status = value;
					this.SendPropertyChanged("Day_status");
					this.OnDay_statusChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="VarChar(10)")]
		public string Status
		{
			get
			{
				return this._Status;
			}
			set
			{
				if ((this._Status != value))
				{
					this.OnStatusChanging(value);
					this.SendPropertyChanging();
					this._Status = value;
					this.SendPropertyChanged("Status");
					this.OnStatusChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Total_per_day", DbType="Float")]
		public System.Nullable<double> Total_per_day
		{
			get
			{
				return this._Total_per_day;
			}
			set
			{
				if ((this._Total_per_day != value))
				{
					this.OnTotal_per_dayChanging(value);
					this.SendPropertyChanging();
					this._Total_per_day = value;
					this.SendPropertyChanged("Total_per_day");
					this.OnTotal_per_dayChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="tblStaff_info_tblTime_Record", Storage="_tblStaff_info", ThisKey="Staff_id", OtherKey="Staff_id", IsForeignKey=true, DeleteOnNull=true, DeleteRule="CASCADE")]
		public tblStaff_info tblStaff_info
		{
			get
			{
				return this._tblStaff_info.Entity;
			}
			set
			{
				tblStaff_info previousValue = this._tblStaff_info.Entity;
				if (((previousValue != value) 
							|| (this._tblStaff_info.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._tblStaff_info.Entity = null;
						previousValue.tblTime_Records.Remove(this);
					}
					this._tblStaff_info.Entity = value;
					if ((value != null))
					{
						value.tblTime_Records.Add(this);
						this._Staff_id = value.Staff_id;
					}
					else
					{
						this._Staff_id = default(int);
					}
					this.SendPropertyChanged("tblStaff_info");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	public partial class reportResult
	{
		
		private string _Fname;
		
		private string _Lname;
		
		private string _Profession;
		
		private System.DateTime _Date;
		
		private System.Nullable<double> _Total_per_day;
		
		public reportResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Fname", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Fname
		{
			get
			{
				return this._Fname;
			}
			set
			{
				if ((this._Fname != value))
				{
					this._Fname = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Lname", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Lname
		{
			get
			{
				return this._Lname;
			}
			set
			{
				if ((this._Lname != value))
				{
					this._Lname = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Profession", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
		public string Profession
		{
			get
			{
				return this._Profession;
			}
			set
			{
				if ((this._Profession != value))
				{
					this._Profession = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Date", DbType="Date NOT NULL")]
		public System.DateTime Date
		{
			get
			{
				return this._Date;
			}
			set
			{
				if ((this._Date != value))
				{
					this._Date = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Total_per_day", DbType="Float")]
		public System.Nullable<double> Total_per_day
		{
			get
			{
				return this._Total_per_day;
			}
			set
			{
				if ((this._Total_per_day != value))
				{
					this._Total_per_day = value;
				}
			}
		}
	}
}
#pragma warning restore 1591