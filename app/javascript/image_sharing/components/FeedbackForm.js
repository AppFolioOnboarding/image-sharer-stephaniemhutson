import React from 'react';

class FeedbackForm extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      name: '',
      comments: '',
      error: false,
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }


  handleSubmit(e) {
    e.preventDefault()
    $.post({url: '/api/feedbacks', data: {feedback: {
        name: this.state.name,
        comments: this.state.comments,
      }},
      success: () => {
        this.setState({
          name: '',
          comments: '',
          error: false,
        })
        alert("Success!")
      },
      error: (data) => {this.setState({error:true})}
    })
    this.props.onSubmit(this.state)
  }

  handleChange(e) {
    this.setState({[e.target.name]: e.target.value})
  }

  render() {
    return <form onSubmit={this.handleSubmit}>
      <div>{this.state.error && "Unable to Submit"}</div>
      <div>
        <label>Your name:</label>
        <input type='text' name='name' onChange={this.handleChange} value={this.state.name}/>
      </div>
      <div>
        <label>Comments</label>
        <input
          type='textarea'
          name='comments'
          onChange={this.handleChange}
          value={this.state.comments}
        />
      </div>
      <div>
        <input type='submit' value='submit'/>
      </div>
    </form>
  }
}

export default FeedbackForm;