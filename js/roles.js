let user = document.querySelector(".rank");

if(user.textContent == "ADMIN"){
    user.classList.add("rank3");
    document.body.classList.add("adminBackground");
} else if(user.textContent == "DELIVERY"){
    user.classList.add("rank2");
    document.body.classList.add("deliveryBackground");
} else{
    user.classList.add("rank1")
    document.body.classList.add("userBackground");
}