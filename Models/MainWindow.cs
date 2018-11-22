using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Management.Automation;

public class MainWindow : INotifyPropertyChanged
{
    private string _title = "";
    private Apps _apps;
    private Services _services;

    public string Title
    {
        get { return _title; }
        set
        {
            _title = value;
            NotifyPropertyChanged("Title");
        }
    }

    public Apps Apps
    {
        get { return _apps; }
        set
        {
            _apps = value;
            NotifyPropertyChanged("Apps");
        }
    }

    public Services Services
    {
        get { return _services; }
        set
        {
            _services = value;
            NotifyPropertyChanged("Services");
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
