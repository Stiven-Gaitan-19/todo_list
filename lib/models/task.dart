class Task{
  String _name;
  String _intialDate;
  String _endDate;
  bool _status;
  
  Task(this._name,this._intialDate, this._endDate, this._status);

  String getName () => _name;
  String getInitialDate () => _intialDate;
  String getEndDate () => _endDate;
  bool getStatus () => _status;
}