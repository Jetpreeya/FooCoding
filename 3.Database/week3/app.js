import Axios from 'axios'
import {userState} from 'react'
function App(){
    const [userList, setUserList] = userState([]);

    const getUser = () => {
        Axios.get('http://localhost:3000/user').then((response) => {
            setUserList(response.date);    
        });
    }
}

<div className="userlist">
    <button className = "btn btn-primary" onClick={getUser}>Show user</button>
    {userList.map((val,key) => {
        return(
            <div className="user card">
            <div className="card-body text-left">
                <p className="card-text">UserID: {val.userID}</p>
                <p className="card-text">First Name: {val.FirstName}</p>
                <p className="card-text">Last Name: {val.LastName}</p>
                <p className="card-text">Email: {val.email}</p>
        </div>
        </div>
        )
    })}
</div>