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
    const spy = sinon.spy();
    const wrapper = mount(<FeedbackForm onSubmit={spy}/>)
    wrapper.find("form").simulate('submit')
    assert(spy.calledOnce)
  })
})
