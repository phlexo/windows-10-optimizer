using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Management.Automation;

public class Item : INotifyPropertyChanged
{
    private string _name = "";
    private string _displayName = "";
    private bool _isChecked = false;

    public string Name
    {
        get { return _name; }
        set
        {
            _name = value;
            NotifyPropertyChanged("Name");
        }
    }

    public string DisplayName
    {
        get { return _displayName; }
        set
        {
            _displayName = value;
            NotifyPropertyChanged("DisplayName");
        }
    }

    public bool IsChecked
    {
        get { return _isChecked; }
        set
        {
            _isChecked = value;
            NotifyPropertyChanged("IsChecked");
        }
    }

    public event PropertyChangedEventHandler PropertyChanged;

    private void NotifyPropertyChanged(string property)
    {
        if(PropertyChanged != null)
        {
            PropertyChanged(this, new PropertyChangedEventArgs(property));
        }
    }
}
