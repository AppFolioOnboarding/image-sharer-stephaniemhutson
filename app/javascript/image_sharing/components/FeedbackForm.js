import React from 'react';

class FeedbackForm extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      name: '',
      comments: '',
    }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }


  handleSubmit() {
    this.props.onSubmit(this.state)
  }

  handleChange(e) {
    this.setState({[e.target.name]: e.target.value})
  }

  render() {
    return <form onSubmit={this.handleSubmit}>
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