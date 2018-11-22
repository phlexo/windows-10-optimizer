using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Management.Automation;

public class MainWindowModel : INotifyPropertyChanged
{
    private string _title = "";
    private readonly ObservableCollection<ItemModel> _applications = new ObservableCollection<ItemModel>();

    public string Title
    {
        get { return _title; }
        set
        {
            _title = value;
            NotifyPropertyChanged("Title");
        }
    }

    public ObservableCollection<ItemModel> Applications
    {
        get { return _applications; }
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
