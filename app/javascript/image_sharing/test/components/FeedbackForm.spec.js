/* eslint-env mocha */

import assert from 'assert';
import { mount, shallow } from 'enzyme';
import React from 'react';
import FeedbackForm from '../../components/FeedbackForm';
import sinon from "sinon";

describe('<FeedbackForm/>', () => {
  it('should render with empty fields', () => {
    const wrapper = shallow(<FeedbackForm/>)
    const name = wrapper.find("input").filter({name: 'name'}).text()
    assert.equal(name, "")
    const comments = wrapper.find("input").filter({name: 'comments'}).text()
    assert.equal(comments, "")
  })

  it('should submit', () => {
    // mock out ajax request
    global.$ = {}
    $.post = sinon.spy()
    const appSubmit = sinon.spy();
    const wrapper = mount(<FeedbackForm onSubmit={appSubmit}/>)

    wrapper.find("form").simulate('submit')
    assert(appSubmit.calledOnce)
    assert($.post.calledOnce)
  })
})
