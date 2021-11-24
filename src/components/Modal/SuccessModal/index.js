import React, { useState, useContext } from 'react';
import { Modal, View, Text } from 'react-native'
import ModalHeader from '../Header';
import { colors, Icon } from '../../../styles';

import styles from './styles'
import { ThemeContext } from "../../../styles/ThemeProvider"

function SuccessModal(props) {
    const [showModal, setShowModal] = useState(props.visible)
    const { colors } = useContext(ThemeContext)

    React.useEffect(() => {
        toogleModal()
    }, [props.visible])

    const toogleModal = () => {
        props.visible ? setShowModal(true) : setShowModal(false)
    }

    return (
        <Modal animationType="fade" transparent={true} visible={showModal}>
            <View style={[styles(colors).globalContainer, styles(colors).modal]}>

                <View style={[styles(colors).container, styles(colors).container_alt]}>
                    <ModalHeader closeAction={props.closeAction} color={colors.text_alt} title="Sucesso!" />
                    <View style={styles(colors).content}>
                        <Icon name="checkmark-circle-outline" style={[styles(colors).icon]} />
                        <Text style={styles(colors).text}>{props.text}</Text>
                    </View>
                </View>
            </View>
        </Modal>
    )
}

export default SuccessModal