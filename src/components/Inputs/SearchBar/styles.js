import { TextInput } from "react-native"
import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import { Ionicons } from "@expo/vector-icons"
import { SearchBar as RNESearchBar } from 'react-native-elements';

export const Container = styled.View`
    height: ${metrics.input.height};
    padding: 0 ${metrics.input.padding} 0 ${metrics.input.padding};
    border-radius: ${metrics.input.padding};
    background-color: ${props => props.theme.colors.card};
`
export const CustomSearchBar = styled(RNESearchBar)`
    height: 100%;
`