getUrlVars = () => {
  var vars = {};
  var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(
    m,
    key,
    value
  ) {
    vars[key] = value;
  });
  return vars;
};

function sleep(seconds) {
  var e = new Date().getTime() + seconds * 1000;
  while (new Date().getTime() <= e) {}
}

window.onload = function() {
  " ";
};
{
  //Get info through params of web address
  const queryString = window.location.search;
  console.log(queryString);
  const urlParams = new URLSearchParams(queryString);
  const snapname = urlParams.get("snap-name");
  var linkedInName = urlParams.get("linked-in-name");
  var twitterName = urlParams.get("twitter-name");
  var facebookName = urlParams.get("facebook-name");
  var instaName = urlParams.get("insta-name");
  const time = 6; //seconds
  //Instagram
  if (instaName != "" && instaName != null) {
    if (instaName.startsWith("www")) {
      instaName = "https://" + instaName;
    } else if (instaName.startsWith("insta")) {
      instaName = "https://www." + instaName;
    } else if (!instaName.startsWith("http")) {
      instaName = "https://www.instagram.com/" + instaName;
    }
    window.open(instaName, "_blank");
  }
  sleep(time);
  //Snapchat
  if (snapname != "" && snapname != null) {
    window.open("https://www.snapchat.com/add/" + snapname, "_blank");
  }
  sleep(time);
  //LinkedIn
  if (linkedInName != "" && linkedInName != null) {
    if (linkedInName.startsWith("www")) {
      linkedInName = "https://" + linkedInName;
    } else if (linkedInName.startsWith("linked")) {
      linkedInName = "https://www." + linkedInName;
    } else if (!linkedInName.startsWith("http")) {
      linkedInName = "https://www.linkedin.com/in/" + linkedInName;
    }
    window.open(linkedInName, "_blank");
  }
  //Twitter
  sleep(time);
  if (twitterName != "" && twitterName != null) {
    if (twitterName.startsWith("mobile")) {
      twitterName = "https://" + twitterName;
    } else if (!twitterName.startsWith("http")) {
      twitterName = "https://mobile.twitter.com/" + twitterName;
    }
    window.open(twitterName, "_blank");
  }
  sleep(time);
  //Facebook
  if (facebookName != "" && facebookName != null) {
    if (facebookName.startsWith("www")) {
      facebookName = "https://" + facebookName;
    } else if (facebookName.startsWith("face")) {
      facebookName = "https://www." + facebookName;
    } else if (!facebookName.startsWith("http")) {
      facebookName = "https://www.facebook.com/" + facebookName;
    }
    window.open(facebookName, "_blank");
  }

  // ?product=shirt&color=blue&newuser&size=m
  //Set code to run when the link is clicked
  // by assigning a function to "onclick"
}
