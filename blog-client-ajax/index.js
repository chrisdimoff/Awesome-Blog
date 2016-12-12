//$(document).ready(function () {
// ð shortcut for âï¸
$(function () {
  var postDetails = $('.post-details')
  var postsList = $('.post-list')
  getPosts();

postsList.on('click', 'li a', function (event) {
    var postId = $(this).parents('li').data('id')
    getPost(postId);

    $(event.delegateTarget).fadeOut(300, function(){
      $('.post-details').fadeIn(300)
    })
  })

  postDetails.on('click', '.btn-back', function (event){
    postDetails.fadeOut(300, function(){
      postsList.fadeIn(300)
    })

  })
});

var DOMAIN = "http://localhost:3000"

function getPosts () {
  $.ajax({
    url: `${DOMAIN}/posts.json`,
    success: function (posts) {

      console.log(posts[0])
      renderPosts(posts);
    },
    error: function () {
      alert('Could not load posts, please try again...')
    }
  })
};

function getPost (id) {
  $.ajax({
    url: `${DOMAIN}/posts/${id}.json`,
    success: function (post) {
      console.log(post)
      renderPost(post);
    },
    error: function () {
      alert(`Could not find post with id(${id}), please try again...`)
    }
  })
}

function renderPost (post) {
  var postDetailsTmpl = $('#post-details').html();
  var postDetails = $('.post-details');

  postDetails.html(Mustache.render(postDetailsTmpl, post));
}

function renderPosts (posts) {
  //Step 1: retrieve mustache template
  var postTemplate = $('#post-summary').html();
  //Step 2: select the ul with jQuery
  var postList = $('.post-list');

  //Step 3: parse the template with Mustache
  Mustache.parse(postTemplate);

  //Step 4: use map to go over all the posts and convert them to
  // html strings
  var postsHTML = posts
    .map(function (post) {
      //Step 5: render each post with the post-summary template
      return Mustache.render(postTemplate, post)
    }).join('');

  //Step 6: take generated html of posts and put it inside ul
  postList.html(postsHTML);
}
