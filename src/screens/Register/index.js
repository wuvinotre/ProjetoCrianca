import React, { useState } from "react"
import { Text, View, Image, KeyboardAvoidingView } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import CustomModal from "../../components/Modal/CustomModal"
import WarningModal from "../../components/Modal/WarningModal"

import firebase from '../../config/firebase';
const auth = firebase.auth();

function Register({ navigation }) {
    const [showModal, setShowModal] = useState(false)
    const [warningModal, setWarningModal] = useState(false)

    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [userName, setUserName] = useState("")
    const [errorMessage, setErrorMessage] = useState("")

    async function onHandleSignup() {
        try {
            if (email !== "" && password !== "" && userName !== "") {
                await auth.createUserWithEmailAndPassword(email, password);
            } else if (password.length < 8) {
                setErrorMessage("A senha deve conter pelo menos 08 dígitos!")
                setWarningModal(true)
            } else if (userName.length < 3) {
                setErrorMessage("Seu nome deve conter pelo menos 03 letras.")
                setWarningModal(true)
            }
        } catch (error) {
            setErrorMessage(error.message)
            setWarningModal(true)
        }
    }

    return (
        <KeyboardAvoidingView
            behavior={Platform.OS === "ios" ? "padding" : "height"}
            style={{ flex: 1 }}
        >
            <Header title="Cadastre-se" navigation={navigation} />

            <View style={styles.globalContainer}>
                <View style={[styles.container]}>
                    <Image source={require('../../../assets/animais.png')} style={styles.image} />

                    <InputText type="name" icon="person-circle-outline" placeholder="Insira seu nome e sobrenome" autoCapitalize="words" onChangeText={text => setUserName(text)} />
                    <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" onChangeText={text => setEmail(text)} />
                    <InputPass type="password" icon="lock-closed-outline" placeholder="Crie uma senha" onChangeText={text => setPassword(text)} />

                    <Button icon="arrow-forward-outline" iconPosition="right" title="Próximo" onPress={() => onHandleSignup()} />
                </View>

                <CustomModal visible={showModal} title="Cadastro" closeAction={() => setShowModal(false)}>
                    <Text>Qual o nome da criança? Essa informação será útil para personalizar a experiência!</Text>
                    <InputText type="name" icon="person-circle-outline" placeholder="Insira o nome e sobrenome" autoCapitalize="words" />
                    <Button icon="checkmark-circle-outline" iconPosition="left" title="Concluído" onPress={() => navigation.navigate("Welcome")} />
                </CustomModal>
                <WarningModal visible={warningModal} closeAction={() => setWarningModal(false)} text={errorMessage} />
            </View>
        </KeyboardAvoidingView >
    )
}

export default Register